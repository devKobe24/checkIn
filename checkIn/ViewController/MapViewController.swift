//
//  MapViewController.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/09.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {
    
    private let mapView: StoreMapView = StoreMapView()
    private let locationManager: CLLocationManager = CLLocationManager()
    
    let miseongokCoordinate = CLLocationCoordinate2D(
        latitude: CLLocationDegrees(floatLiteral: 37.564103),
        longitude: CLLocationDegrees(floatLiteral: 126.983885)
    )
    
    override func loadView() {
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        mapView.map.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        setMapRegion()
        addCustomPin()
        buttonActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("위치 업데이트")
            print("위도 : \(location.coordinate.latitude)")
            print("경도 : \(location.coordinate.longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkUserLocationServicesAuthorization()
    }
}

extension MapViewController {
    private func checkUserLocationServicesAuthorization() {
        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14, *) {
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.checkCurrentLocationAuthorization(authorizationStatus: authorizationStatus)
            }
        }
    }
    
    private func setMapRegion() {
        mapView.map.setRegion(
            MKCoordinateRegion(
                center: miseongokCoordinate,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.01,
                    longitudeDelta: 0.01
                )
            ), animated: true
        )
    }
    
    private func addCustomPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = miseongokCoordinate
        pin.title = "미성옥"
        pin.subtitle = "1966년부터 이어진 설렁탕 전문 음식점"
        
        mapView.map.addAnnotation(pin)
    }
    
    private func checkCurrentLocationAuthorization(authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        case .restricted:
            print("restricted")
            goSetting()
        case .denied:
            print("denided")
            goSetting()
        case .authorizedAlways:
            print("always")
        case .authorizedWhenInUse:
            print("wheninuse")
            locationManager.startUpdatingLocation()
        @unknown default:
            print("unknown")
        }
        if #available(iOS 14.0, *) {
            let accuracyState = locationManager.accuracyAuthorization
            switch accuracyState {
            case .fullAccuracy:
                print("full")
            case .reducedAccuracy:
                print("reduced")
            @unknown default:
                print("Unknown")
            }
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        var annotationView = self.mapView.map.dequeueReusableAnnotationView(withIdentifier: "Custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Custom")
            annotationView?.canShowCallout = true
            
            let miniButton = UIButton(
                frame: CGRect(
                    x: 0,
                    y: 0,
                    width: 20,
                    height: 20
                )
            )
            miniButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            miniButton.imageView?.contentMode = .scaleAspectFit
            miniButton.tintColor = .systemBlue
            annotationView?.rightCalloutAccessoryView = miniButton
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "pin")
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let storeViewController = StoreViewController()
        present(storeViewController, animated: true)
    }
}

extension MapViewController {
    private func goSetting() {
        let alert = UIAlertController(title: "위치권한 요청", message: "항상 위치 권한이 필요합니다.", preferredStyle: .alert)
        let settingAction = UIAlertAction(title: "설정", style: .default) { action in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            // 열 수 있는 url 이라면, 이동
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { UIAlertAction in
            
        }
        
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func buttonActions() {
        mapView.myLocationButton.addTarget(self, action: #selector(findMyLocation), for: .touchUpInside)
        mapView.miseongokLocationButton.addTarget(self, action: #selector(findMiseongokLocation), for: .touchUpInside)
    }
    
    @objc func findMyLocation() {
        mapView.map.showsUserLocation = true
        
        mapView.map.setUserTrackingMode(.follow, animated: true)
        
    }
    
    @objc func findMiseongokLocation() {
        
        mapView.map.showsUserLocation = false
        
        mapView.map.userTrackingMode = .none
        
        mapView.map.setRegion(MKCoordinateRegion(center: miseongokCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)), animated: true)
    }
}
