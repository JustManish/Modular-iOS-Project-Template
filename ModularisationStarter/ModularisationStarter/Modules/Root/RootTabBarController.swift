//
//  RootTabBarController.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import Localisation
import UIKit
import Utilities

final class RootTabBarController: UITabBarController {

    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        setViewControllers(viewControllers, animated: false)
        updateTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func updateTabBar() {
        guard let items = tabBar.items else {
            return
        }
        
        let firstItem = items[0]
        firstItem.title = "ms_tabbar_home_title".localisedCommon
        firstItem.image = UIImage(systemName: "house")
    }
}
