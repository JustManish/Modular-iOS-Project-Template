import Foundation

public extension String {
    var localisedCommon: String {
        NSLocalizedString(self, bundle: .module, comment: "")
    }
}
