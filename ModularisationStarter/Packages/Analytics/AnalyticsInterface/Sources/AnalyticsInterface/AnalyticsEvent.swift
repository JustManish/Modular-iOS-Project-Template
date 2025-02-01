//
//  AnalyticsEvent.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 15.02.24.
//

import Foundation

public struct AnalyticsEvent {

    public let name: String
    public let parameters: [String: Any]?

    public init(name: String, parameters: [String : Any]? = nil) {
        self.name = name
        self.parameters = parameters
    }
}
