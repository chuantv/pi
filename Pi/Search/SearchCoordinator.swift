//
//  SearchCoordinator.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import UIKit

class SearchCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    override func start() {
        let view = SearchViewController.instantiate()
        let service = AirportService.shared
        view.viewModel = SearchViewModel(service: service)
        self.navigationController.pushViewController(view, animated: false)
        
    }
}
