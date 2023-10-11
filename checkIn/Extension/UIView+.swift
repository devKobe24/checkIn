//
//  UIView.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/09.
//

import UIKit

extension UIView {
    func seperateLine() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.borderWidth = 0.5
        let width = self.frame.width
        self.frame = CGRect(x: 0, y: 0, width: width, height: 0)
        
        return self
    }
}
