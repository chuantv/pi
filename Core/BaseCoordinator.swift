//
//  BaseCoordinator.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    func start() {
        fatalError("Children should implement 'start'.")
    }
    
    
}
