//
//  Coordinator.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import Foundation


protocol Coordinator: class {
    var childCoordinators: [Coordinator] {get set}
    func start()
}

extension Coordinator {
    func add(coordinator: Coordinator) -> Void {
        childCoordinators.append(coordinator)
    }
    func remove(coordinator: Coordinator) -> Void {
        childCoordinators = childCoordinators.filter({$0 !== coordinator})
    }
}
