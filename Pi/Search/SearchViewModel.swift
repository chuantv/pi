//
//  SearchViewModel.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import RxCocoa
import RxSwift
import RxRelay

protocol SearchViewPresentable {
    
}

class SearchViewModel{
    struct Input {
        let searchText: Driver<String>
    }
    
    struct Output {
        @Property var cities = [AirportModel]()
    }
    
    typealias State = (airports: BehaviorRelay<Set<AirportModel>>, ())
    private let state: State = (airports: BehaviorRelay<Set<AirportModel>>(value: []), ())
    
    private let airportService: AirportAPI
    
    init(service: AirportAPI) {
        self.airportService = service
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        
        let output = Output()
        
        
        self.airportService.fetchAirports()
            .map({Set($0)})
            .map({ [state] in state.airports.accept($0)
            })
            .subscribe()
            .disposed(by: disposeBag)
        
   
        let searchText = input.searchText
            .debounce(.milliseconds(300))
            .distinctUntilChanged()
            .skip(1)
            .asObservable()
            .share(replay: 1, scope: .whileConnected)
        
        let airports = state.airports
            .asObservable()
        
        Observable.combineLatest(searchText,
                                 airports)
            .map ({ (searchKey, airports) in
                return airports.filter{ (airport) -> Bool in
                    !searchKey.isEmpty &&
                    airport.city
                        .lowercased()
                        .replacingOccurrences(of: " ", with: "")
                        .hasPrefix(searchKey.lowercased())
                }
            })
            .asDriver(onErrorJustReturn: [])
            .drive(output.$cities)
            .disposed(by: disposeBag)
        
        return output
    }
}


