//
//  UIViewController+.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/11.
//

import UIKit

extension UIViewController {
    func setupViewController(
        viewController: UIViewController,
        tabBarItemSelectedImageName: String,
        tabBarItemImageName: String,
        tabBarItemTitle: String
    ) -> UIViewController {
        guard let tabBarItemSelectedImage = UIImage(systemName: tabBarItemSelectedImageName) else {
            return UIViewController()
        }
        
        guard let tabBarItemImage = UIImage(systemName: tabBarItemImageName) else {
            return UIViewController()
        }
        
        viewController.tabBarItem.selectedImage = tabBarItemSelectedImage
        viewController.tabBarItem.image = tabBarItemImage
        viewController.tabBarItem.title = tabBarItemTitle
        
        return viewController
    }
}
