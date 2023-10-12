//
//  StoreViewController.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/09.
//

import UIKit

class StoreViewController: UIViewController {
    let storeBannerView = StoreBannerView(storeBannerImageName: "testBanner")
    
    let informationContainerView: InformationContainerView = InformationContainerView()
    
    let storeInformationCircleButton1: StoreInformationCircleButton = StoreInformationCircleButton()
    
    let storeInformationCircleButton2: StoreInformationCircleButton = StoreInformationCircleButton()
    
    let storeInformationCircleButton3: StoreInformationCircleButton = StoreInformationCircleButton()
    
    var representationMeneCollectionView: RepresentativeMenuCollectionView = {
       let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        let widthAndHeight = UIScreen.main.bounds.width - 10
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let collectionView = RepresentativeMenuCollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.register(
            RepresentativeMenuCollectionViewCell.self,
            forCellWithReuseIdentifier: RepresentativeMenuCollectionViewCell.cellIdentifier
        )
        
        collectionView.contentInset = UIEdgeInsets(
            top: 10,
            left: 10,
            bottom: 10,
            right: 10
        )
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.decelerationRate = .fast
        
        return collectionView
    }()
    
    let data = RepresentativeMenuData()
    
    var lastScrollOffset: CGFloat = 0
    
    let storeInformationDescriptionView: StoreInformationDescriptionView = StoreInformationDescriptionView()
    
    // 컬랙션 뷰
    // 배너 v
    // 식당 이름v
    // 정보 컨테이너 뷰 v
    // 정보 서클 뷰v
    // 식당 홈페이지v
    // 전화 번호v
    // 식당 위치v
    
    // 식당 소개
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        storeBannerViewUItest()
        
        infomationContainerViewUITest()
        
        storeInformationCircleButton1UITest()
        storeInformationCircleButton2UITest()
        storeInformationCircleButton3UITest()
        
        storeInformationCicleButton3PhoneCallTest()
        
        storeInformationDescriptionViewConfigureTest()
        storeInformationDescriptionViewUITest()
        
        representCollectionViewConfigureTest()
        representCollectionViewUITest()
        
    }
    
    func storeBannerViewUItest() {
        self.view.addSubview(storeBannerView)
        
        NSLayoutConstraint.activate([
            storeBannerView.topAnchor.constraint(equalTo: view.topAnchor),
            storeBannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storeBannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storeBannerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/6)
        ])
    }
    
    func infomationContainerViewUITest() {
        self.view.addSubview(informationContainerView)
        
        NSLayoutConstraint.activate([
            informationContainerView.topAnchor.constraint(equalTo: storeBannerView.bottomAnchor, constant: 30),
            informationContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            informationContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            informationContainerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/8)
            
        ])
    }
    
    func storeInformationCircleButton1UITest() {
        self.informationContainerView.addSubview(storeInformationCircleButton1)
        
        storeInformationCircleButton1.setImage(UIImage(systemName: "location.fill"), for: .normal)
        storeInformationCircleButton1.tintColor = UIColor(hexCode: "e54b4b", alpha: 1.0)
        
        NSLayoutConstraint.activate([
            storeInformationCircleButton1.centerYAnchor.constraint(equalTo: informationContainerView.centerYAnchor),
            storeInformationCircleButton1.leadingAnchor.constraint(equalTo: informationContainerView.leadingAnchor, constant: 10),
            storeInformationCircleButton1.heightAnchor.constraint(equalTo: informationContainerView.heightAnchor, multiplier: 2.5/3),
            storeInformationCircleButton1.widthAnchor.constraint(equalTo: storeInformationCircleButton1.heightAnchor, multiplier: 1)
            
        ])
    }
    
    func storeInformationCircleButton2UITest() {
        self.informationContainerView.addSubview(storeInformationCircleButton2)
        
        storeInformationCircleButton2.setImage(UIImage(systemName: "network"), for: .normal)
        storeInformationCircleButton2.tintColor = UIColor(hexCode: "e54b4b", alpha: 1.0)
        
        NSLayoutConstraint.activate([
            storeInformationCircleButton2.centerYAnchor.constraint(equalTo: informationContainerView.centerYAnchor),
            storeInformationCircleButton2.centerXAnchor.constraint(equalTo: informationContainerView.centerXAnchor),
            storeInformationCircleButton2.heightAnchor.constraint(equalTo: informationContainerView.heightAnchor, multiplier: 2.5/3),
            storeInformationCircleButton2.widthAnchor.constraint(equalTo: storeInformationCircleButton1.heightAnchor, multiplier: 1)
            
        ])
    }
    
    func storeInformationCircleButton3UITest() {
        self.informationContainerView.addSubview(storeInformationCircleButton3)
        
        storeInformationCircleButton3.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        storeInformationCircleButton3.tintColor = UIColor(hexCode: "e54b4b", alpha: 1.0)
        
        NSLayoutConstraint.activate([
            storeInformationCircleButton3.centerYAnchor.constraint(equalTo: informationContainerView.centerYAnchor),
            storeInformationCircleButton3.trailingAnchor.constraint(equalTo: informationContainerView.trailingAnchor, constant: -10),
            storeInformationCircleButton3.heightAnchor.constraint(equalTo: informationContainerView.heightAnchor, multiplier: 2.5/3),
            storeInformationCircleButton3.widthAnchor.constraint(equalTo: storeInformationCircleButton1.heightAnchor, multiplier: 1)
            
        ])
    }
    
    func storeInformationCicleButton3PhoneCallTest() {
        storeInformationCircleButton3.addTarget(self, action: #selector(phoneCall), for: .touchUpInside)
    }
    
    @objc private func phoneCall() {
        guard let number = URL(string: "tel://" + "01089535200") else { return }
        DispatchQueue.main.async {
            UIApplication.shared.open(number)
        }
    }
    
    func storeInformationDescriptionViewUITest() {
        self.view.addSubview(storeInformationDescriptionView)
        storeInformationDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        storeInformationDescriptionView.backgroundColor = .systemBackground
        let safeArea = self.view.safeAreaLayoutGuide
       
        NSLayoutConstraint.activate([
            storeInformationDescriptionView.topAnchor.constraint(equalTo: informationContainerView.bottomAnchor, constant: 30),
            storeInformationDescriptionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            storeInformationDescriptionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            storeInformationDescriptionView.heightAnchor.constraint(equalTo: informationContainerView.heightAnchor, multiplier: 1)
        ])
    }
    
    func storeInformationDescriptionViewConfigureTest() {
        storeInformationDescriptionView.storeNameLabel.text = "미성옥"
        storeInformationDescriptionView.storeAddressLabel.text = "서울특별시 중구 명동길 25-11"
        storeInformationDescriptionView.storeDescriptionLabel.text = "1966년부터 이어져온 설렁탕 전문 맛집 미성옥."
    }
    
    func representCollectionViewConfigureTest() {
        representationMeneCollectionView.delegate = self
        representationMeneCollectionView.dataSource = self
        representationMeneCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func representCollectionViewUITest() {
        self.view.addSubview(representationMeneCollectionView)
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            representationMeneCollectionView.topAnchor.constraint(equalTo: storeInformationDescriptionView.bottomAnchor, constant: 30),
            representationMeneCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            representationMeneCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -30),
            representationMeneCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30)
        ])
    }
}

extension StoreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width/2) + 100
        let height = (self.view.frame.width/2) + 130
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.representativeMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = representationMeneCollectionView.dequeueReusableCell(withReuseIdentifier: RepresentativeMenuCollectionViewCell.cellIdentifier, for: indexPath) as? RepresentativeMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 14
        
        if indexPath.row != 0 {
            cell.transform = CGAffineTransform(scaleX: 1, y: 0.87)
        }
        
        let meneImageName = data.representativeMenu[indexPath.row]
        guard let menuImage = UIImage(named: meneImageName) else {
            return UICollectionViewCell()
        }
        cell.representativeMenuImageView.image = menuImage
        
        return cell
    }
}

extension StoreViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellArea = CGFloat(Int(((view.frame.width)/2)+100) + 20)
        
        var offset = targetContentOffset.pointee
        
        let idx = round(offset.x/cellArea)
        
        offset = CGPoint(x: idx * cellArea, y: 0)
        
        targetContentOffset.pointee = offset
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cellArea = CGFloat(Int(((view.frame.width)/2)+100) + 20)
        let curScrollOffset = scrollView.contentOffset.x
        
        if lastScrollOffset < curScrollOffset {
            let idx = curScrollOffset / cellArea
            let indexPath = IndexPath(item: Int(round(idx)), section: 0)
            
            if let cell = representationMeneCollectionView.cellForItem(at: indexPath) {
                transformCellOriginSize(cell) {
                    
                }
            }
            let prevIndexPath = IndexPath(item: Int(round(idx) - 1), section: 0)
            if let prevCell = representationMeneCollectionView.cellForItem(at: prevIndexPath) {
                transformCellMinifyWithAnimation(prevCell) {
                    
                }
            }
        } else if lastScrollOffset > curScrollOffset {
            let idx = Int(round(lastScrollOffset / cellArea))
            let indexPath = IndexPath(item: idx, section: 0)
            if let cell = representationMeneCollectionView.cellForItem(at: indexPath) {
                transformCellMinifyWithAnimation(cell) {
                    
                }
            }
            let prevIdx = curScrollOffset / cellArea
            let prevIndexPath = IndexPath(item: Int(round(prevIdx)), section: 0)
            if let prevCell = representationMeneCollectionView.cellForItem(at: prevIndexPath) {
                transformCellOriginSize(prevCell) {
                    
                }
            }
        }
        lastScrollOffset = scrollView.contentOffset.x
    }
    
    func transformCellOriginSize(
      _ cell: UICollectionViewCell,
      completion: @escaping () -> Void) {
      UIView.animate(
        withDuration: 0.13,
        delay: 0,
        options: .curveEaseOut,
        animations: {cell.transform = .identity}) {_ in
          completion()
        }
    }

    func transformCellMinifyWithAnimation(
      _ cell: UICollectionViewCell,
      completion: @escaping () -> Void) {
        UIView.animate(
          withDuration: 0.13,
          delay: 0,
          options: .curveEaseOut,
          animations: {cell.transform = CGAffineTransform(scaleX: 1, y: 0.87)}) {_ in
            completion()
          }
      }
}
