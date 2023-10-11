//
//  StoreInformationCircleButton.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/09.
//

import UIKit

final class StoreInformationCircleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStoreInformationCircleButton()
        configureStoreInformationCircleButtonUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StoreInformationCircleButton {
    private func setupStoreInformationCircleButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 45
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1
        self.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        self.layer.shadowOffset = CGSize(width: 1, height: 10)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.black.cgColor
        
        self.imageView?.contentMode = .scaleToFill
    }
    
    private func configureStoreInformationCircleButtonUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        
        guard let imageView = self.imageView else {
            return
        }
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.topAnchor),
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
        ])
    }
    

}
