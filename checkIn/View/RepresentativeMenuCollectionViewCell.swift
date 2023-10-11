//
//  RepresentativeMenuCollectionViewCell.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/09.
//

import UIKit

final class RepresentativeMenuCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RepresentativeMenuCollectionViewCell"
    
    var representativeMenuImageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        constrainsCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        
        setupCell()
        constrainsCell()
    }
}

extension RepresentativeMenuCollectionViewCell {
    func setupCell() {
        contentView.addSubview(representativeMenuImageView)
        representativeMenuImageView.layer.cornerRadius = 10
        representativeMenuImageView.clipsToBounds = true
        representativeMenuImageView.contentMode = .scaleAspectFill
    }
    
    func constrainsCell() {
        representativeMenuImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            representativeMenuImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            representativeMenuImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            representativeMenuImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            representativeMenuImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
