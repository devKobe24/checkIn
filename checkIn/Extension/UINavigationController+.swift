//
//  UINavigationController+.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/11.
//

import UIKit

extension UINavigationController {
    func createNavigationController(
        viewController: UIViewController,
        tabBarItemSelectedImageName: String,
        tabBarItemImageName: String,
        tabBarItemTitle: String
    ) -> UINavigationController {
        let viewController = UIViewController().setupViewController(
            viewController: viewController,
            tabBarItemSelectedImageName: tabBarItemSelectedImageName,
            tabBarItemImageName: tabBarItemImageName,
            tabBarItemTitle: tabBarItemTitle
        )
        return UINavigationController(rootViewController: viewController)
    }
}
