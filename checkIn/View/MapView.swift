//
//  StoreMapView.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/09.
//

import UIKit
import MapKit

final class StoreMapView: UIView {
    let map: MKMapView = MKMapView()
    
    let miseongokLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("미성옥 위치로 가기", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.yellow, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    let myLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("내 위치로 가기", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.yellow, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constraintsMapView()
        constraintsMyLocationButtonUI()
        constraintsMiseongokLocationButtonUI()   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StoreMapView {
    private func constraintsMapView() {
        map.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(map)
        
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: self.topAnchor),
            map.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            map.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func constraintsMiseongokLocationButtonUI() {
        miseongokLocationButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(miseongokLocationButton)
        
        NSLayoutConstraint.activate([
            miseongokLocationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            miseongokLocationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            miseongokLocationButton.bottomAnchor.constraint(equalTo: myLocationButton.topAnchor, constant: -20),
            miseongokLocationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func constraintsMyLocationButtonUI() {
        myLocationButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(myLocationButton)
        
        NSLayoutConstraint.activate([
            myLocationButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            myLocationButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            myLocationButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            myLocationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
