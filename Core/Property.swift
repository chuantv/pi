//
//  Property.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import UIKit
import RxSwift
import RxCocoa

@propertyWrapper
public struct Property<Value> {
    
    private var subject: BehaviorRelay<Value>
   
    public var wrappedValue: Value {
        get {
            return subject.value
        }
        set {
            subject.accept(newValue)
        }
    }
    
    public var projectedValue: BehaviorRelay<Value> {
        return self.subject
    }
    
    public init(wrappedValue: Value) {
        subject = BehaviorRelay(value: wrappedValue)
    }
}

