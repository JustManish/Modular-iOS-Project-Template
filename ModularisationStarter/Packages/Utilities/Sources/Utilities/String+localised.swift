//
//  String+localised.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 14.02.24.
//

import Foundation

public extension String {
    
    var localised: String {
        NSLocalizedString(self, comment: "")
    }

    func localised(bundle: Bundle) -> String {
        NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
