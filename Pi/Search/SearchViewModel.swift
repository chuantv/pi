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
        @Property var listText = [String]()
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        
        let output = Output()
        
        return output
    }
}
