//
//  LocationManager.swift
//  Map hackwich
//
//  Created by Ela Murat on 27/07/2022.
//

import Foundation
import CoreLocation

class LocationManager:NSObject,CLLocationManagerDelegate, ObservableObject {
 var locationManager = CLLocationManager()
 var geocoder = CLGeocoder()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
