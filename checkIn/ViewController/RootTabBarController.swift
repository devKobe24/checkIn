//
//  RootTabBarController.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/11.
//

import UIKit

final class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRootTabBarController()
    }
    
    private func setupRootTabBarController() {
        self.tabBar.tintColor = UIColor(hexCode: "e54b4b", alpha: 1.0)
        
        let mapViewController = UIViewController().setupViewController(
            viewController: MapViewController(),
            tabBarItemSelectedImageName: "map.fill",
            tabBarItemImageName: "map",
            tabBarItemTitle: "지도"
        )
        
        let storeListViewController = UINavigationController().createNavigationController(
            viewController: StoreListViewController(),
            tabBarItemSelectedImageName: "list.bullet",
            tabBarItemImageName: "list.bullet",
            tabBarItemTitle: "리스트"
        )
        
        self.viewControllers = [
            mapViewController,
            storeListViewController
        ]
    }
}
