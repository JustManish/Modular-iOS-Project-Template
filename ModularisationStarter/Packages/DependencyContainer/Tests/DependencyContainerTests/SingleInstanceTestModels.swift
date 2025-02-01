//
//  SingleInstanceTestModels.swift
//
//
//  Created by Emre Havan on 04.03.24.
//

import Foundation

protocol SingleInstanceProtocol: AnyObject {
    func sampleMethod()
}

final class SingleInstanceImplementation: SingleInstanceProtocol {
    func sampleMethod() {
        // left blank intentionally
    }
}
