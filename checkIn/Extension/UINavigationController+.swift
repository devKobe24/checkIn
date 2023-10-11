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
//        guard let tabBarItemSelectedImage = UIImage(systemName: tabBarItemSelectedImageName) else {
//            return UINavigationController()
//        }
//        guard let tabBarItemImage = UIImage(systemName: tabBarItemImageName) else {
//            return UINavigationController()
//        }
//        
//        viewController.tabBarItem.selectedImage = tabBarItemSelectedImage
//        viewController.tabBarItem.image = tabBarItemImage
//        viewController.tabBarItem.title = tabBarItemTitle
        let viewController = UIViewController().setupViewController(
            viewController: viewController,
            tabBarItemSelectedImageName: tabBarItemSelectedImageName,
            tabBarItemImageName: tabBarItemImageName,
            tabBarItemTitle: tabBarItemTitle
        )
        return UINavigationController(rootViewController: viewController)
    }
}
