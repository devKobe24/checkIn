//
//  StoreBannerView.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/09.
//

import UIKit

final class StoreBannerView: UIView {
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(storeBannerImageName: String) {
        super.init(frame: .zero)
        setupStoreBannerView()
        setupBannerImageView(storeBannerImageName: storeBannerImageName)
        constraintsBannerImageView()
    }
}

extension StoreBannerView {
    private func setupStoreBannerView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor.systemGray3.cgColor
    }
    
    private func setupBannerImageView(storeBannerImageName: String) {
        guard let storeBannerImage = UIImage(named: storeBannerImageName) else {
            return
        }
        bannerImageView.image = storeBannerImage
        bannerImageView.contentMode = .scaleAspectFill
    }
    
    private func constraintsBannerImageView() {
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
