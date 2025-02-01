//
//  ClosureBasedTestModels.swift
//  
//
//  Created by Emre Havan on 04.03.24.
//

import Foundation

protocol ClosureBasedProtocol {
    func sampleMethod()
}

struct ClosureBasedImplementation: ClosureBasedProtocol {
    func sampleMethod() {
        // left blank intentionally
    }
}

protocol AnotherDependencyProtocol {
    func anotherSampleMethod()
}

struct AnotherDependencyImplementation: AnotherDependencyProtocol {

    private let service: ClosureBasedProtocol

    init(service: ClosureBasedProtocol) {
        self.service = service
    }

    func anotherSampleMethod() {
        // left blank intentionally
    }
}
