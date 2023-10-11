//
//  StoreInformationDescriptionView.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/10.
//

import UIKit

final class StoreInformationDescriptionView: UIView {
    let storeNameLabel: UILabel = UILabel()
    private let mappinSymbolImageView: UIImageView = UIImageView()
    let storeAddressLabel: UILabel = UILabel()
    let storeDescriptionLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStoreNameLabel()
        setupMappinSymbolImageView()
        setupStoreAddressLabel()
        setupStoreDescriptionLabel()
        
        constraintStoreNameLabel()
        constraintMappinSymbolImageView()
        constraintStoreAddressLabel()
        constraintStoreDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StoreInformationDescriptionView {
    private func setupStoreNameLabel() {
        storeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        storeNameLabel.textAlignment = .left
        storeNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setupMappinSymbolImageView() {
        mappinSymbolImageView.translatesAutoresizingMaskIntoConstraints = false
        mappinSymbolImageView.image = UIImage(systemName: "mappin.and.ellipse")
        mappinSymbolImageView.tintColor = .systemGray3
    }
    
    private func setupStoreAddressLabel() {
        storeAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        storeAddressLabel.textAlignment = .left
        storeAddressLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        storeAddressLabel.textColor = UIColor.systemGray3
    }
    
    private func setupStoreDescriptionLabel() {
        storeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        storeDescriptionLabel.textAlignment = .left
        storeDescriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
}

extension StoreInformationDescriptionView {
    private func constraintStoreNameLabel() {
        addSubview(storeNameLabel)
        
        NSLayoutConstraint.activate([
            storeNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            storeNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            storeNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            storeNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4)
        ])
    }
    
    private func constraintMappinSymbolImageView() {
        addSubview(mappinSymbolImageView)
        
        NSLayoutConstraint.activate([
            mappinSymbolImageView.topAnchor.constraint(equalTo: storeNameLabel.bottomAnchor, constant: 10),
            mappinSymbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            mappinSymbolImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/5),
            mappinSymbolImageView.widthAnchor.constraint(equalTo: mappinSymbolImageView.heightAnchor, multiplier: 1),
        ])
        
    }
    
    private func constraintStoreAddressLabel() {
        addSubview(storeAddressLabel)
        
        NSLayoutConstraint.activate([
            storeAddressLabel.topAnchor.constraint(equalTo: storeNameLabel.bottomAnchor, constant: 10),
            storeAddressLabel.leadingAnchor.constraint(equalTo: mappinSymbolImageView.trailingAnchor, constant: 5),
            storeAddressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            storeAddressLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/5)
        ])
    }
    
    private func constraintStoreDescriptionLabel() {
        addSubview(storeDescriptionLabel)
        
        NSLayoutConstraint.activate([
            storeDescriptionLabel.topAnchor.constraint(equalTo: storeAddressLabel.bottomAnchor, constant: 10),
            storeDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            storeDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            storeDescriptionLabel.heightAnchor.constraint(equalTo: mappinSymbolImageView.heightAnchor, multiplier: 1)
        ])
    }
}
