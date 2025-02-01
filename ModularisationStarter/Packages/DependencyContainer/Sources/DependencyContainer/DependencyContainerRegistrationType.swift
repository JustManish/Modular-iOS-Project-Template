//
//  DependencyContainerRegistrationType.swift
//
//
//  Created by Emre Havan on 02.03.24.
//

import Foundation

public enum DependencyContainerRegistrationType {
    case singleInstance(AnyObject)
    case closureBased(() -> Any)
}
