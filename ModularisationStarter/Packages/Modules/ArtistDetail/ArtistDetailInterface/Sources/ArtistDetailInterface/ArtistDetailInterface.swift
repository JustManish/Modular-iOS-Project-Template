import UIKit

public protocol ArtistDetailInterface {
    func makeArtistDetailModule(
        navigationController: UINavigationController?,
        artistIdentifier: String
    ) -> UIViewController
}
