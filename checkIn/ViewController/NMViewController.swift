//
//  NMViewController.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/12.
//

import UIKit
import NMapsMap

final class NMViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nmView = NMFMapView(frame: view.frame)
        view.addSubview(nmView)
    }
}
