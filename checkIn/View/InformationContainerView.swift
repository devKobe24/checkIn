//
//  InformationContainerView.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/09.
//

import UIKit

final class InformationContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInformationContainerView()
        configureInformationContainerViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension InformationContainerView {
    private func setupInformationContainerView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(hexCode: "e54b4b", alpha: 1.0)
        self.layer.cornerRadius = 50
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1
    }
    
    private func configureInformationContainerViewUI() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.topAnchor),
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
