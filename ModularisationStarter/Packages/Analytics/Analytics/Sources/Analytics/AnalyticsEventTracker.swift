//
//  AnalyticsEventTracker.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 14.02.24.
//

import AnalyticsInterface
import Foundation

public final class AnalyticsEventTracker: AnalyticsEventTracking {

    public init() {}
    
    public func trackEvent(_ event: AnalyticsEvent) {
        // Call analytics 3rd party framework or your own implementation to track an event
    }
}
