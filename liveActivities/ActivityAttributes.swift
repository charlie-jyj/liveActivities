//
//  ActivityAttributes.swift
//  liveActivities
//
//  Created by 정유진 on 2022/12/27.
//

import Foundation

@propertyWrapper
enum Lazy<T> {
    // associated value는 type을 명시
    case uninitialized(() -> T)
    case initialized(T)
    
    init(wrappedValue initialValue: @autoclosure @escaping () -> T) {
        self = .uninitialized(initialValue)
    }
    
    var wrappedValue: T {
        mutating get {
            switch self {
            case .uninitialized(let initializer):
                let value = initializer()
                self = .initialized(value)
                return value
            case .initialized(let value):
                return value
            }
        }
        set {
            self = .initialized(newValue)
        }
    }
    
}

class Foo {
    @Lazy var foo = 1738
}
