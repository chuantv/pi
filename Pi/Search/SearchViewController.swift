//
//  SearchViewController.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import UIKit

class SearchViewController: UIViewController, Storyboardable {

    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUI()
        setupBinding()
    }

}

extension SearchViewController {
    func setupUI(){
        
    }
    
    func setupBinding(){
        
    }
}
