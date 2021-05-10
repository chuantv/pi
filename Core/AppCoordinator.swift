//
//  AppCoordinator.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    
    private let navigationController: UINavigationController = {
        let nav = UINavigationController()
        let navbar = nav.navigationBar
        navbar.setBackgroundImage(UIImage(), for: .default)
        navbar.shadowImage = UIImage()
        navbar.barTintColor = .systemPink
        navbar.tintColor = .white
        navbar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 28.0)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navbar.isTranslucent = false
        
        return nav
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let searchCoordinator = SearchCoordinator(navigationController: self.navigationController)
        self.add(coordinator: searchCoordinator)
        searchCoordinator.start()
        
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
