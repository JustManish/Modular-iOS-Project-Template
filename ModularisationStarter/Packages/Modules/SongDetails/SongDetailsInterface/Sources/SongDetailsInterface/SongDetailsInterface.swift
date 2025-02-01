import CommonModels
import UIKit

public protocol SongDetailsInterface {
    func makeSongDetailsModule(navigationController: UINavigationController?, song: Song) -> UIViewController
}
