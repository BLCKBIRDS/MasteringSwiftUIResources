//File: LocationManager.swift
//Project: ProjectPhotoMapTutorial

//Created at 19.12.19 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.

import Foundation
import MapKit

class LocationManager: ObservableObject {
    
    var userLocationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    
    init() {
        
        requestPermission()
        
        guard let userLocation = userLocationManager.location?.coordinate else {return}
        
        currentRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: CLLocationDistance(1000), longitudinalMeters: CLLocationDistance(1000))
    }
    
    @Published var currentRegion = MKCoordinateRegion(center: CLLocation(latitude: 48.864716, longitude: 2.349014).coordinate, latitudinalMeters: CLLocationDistance(10000), longitudinalMeters: CLLocationDistance(10000))
    
    func requestPermission() {
        if self.authorizationStatus == .notDetermined {
            self.userLocationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
    func goToUserLocation() {
        guard let userLocation = userLocationManager.location?.coordinate else {return}
        
        currentRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: CLLocationDistance(1000), longitudinalMeters: CLLocationDistance(1000))
    }
    
}
