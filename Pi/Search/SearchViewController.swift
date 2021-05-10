//
//  SearchViewController.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources


typealias CityItemsSection = SectionModel<Int, AirportModel>
class SearchViewController: UIViewController, Storyboardable {
    
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    
    private lazy var datasource = RxTableViewSectionedReloadDataSource<CityItemsSection> { (_, tableView, indexPath, item) -> UITableViewCell in
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        cell.config(model: item)
        return cell
    }
    
    var viewModel: SearchViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBinding()
    }
    
}

extension SearchViewController {
    func setupUI(){
        self.title = "Search Airports"
    }
    
    func setupBinding(){
        
        let input  = SearchViewModel.Input(
            searchText: searchTextfield.rx.text.orEmpty.asDriver()
        )
        
        let output = viewModel.transform(input, disposeBag: self.bag)
        output.$cities
            .map({[CityItemsSection(model: 0, items: $0)]})
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(dataSource: self.datasource))
            .disposed(by: bag)
        
    }
}
