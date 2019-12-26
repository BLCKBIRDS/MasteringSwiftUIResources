//File: MyMap.swift
//Project: ProjectPhotoMapTutorial

//Created at 18.12.19 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.

//import Foundation
import SwiftUI
import MapKit

struct MyMap: UIViewRepresentable {
    
    @Binding var currentRegion: MKCoordinateRegion
    @Binding var currentAnnotation: MKPointAnnotation?
    @Binding var showPhotoGrid: Bool
    
    func makeCoordinator() -> MyMap.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        
        map.showsUserLocation = true
        map.setRegion(currentRegion, animated: true)
        
        context.coordinator.map = map
        
        let longPress = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.didLongPress(gesture:)))
        longPress.minimumPressDuration = 1.0
        map.addGestureRecognizer(longPress)
        return map
    }
    
    func updateUIView(_ map: MKMapView, context: Context) {
        
        if currentAnnotation != nil {
            map.removeAnnotations(map.annotations)
            map.addAnnotation(currentAnnotation!)
        }
        
        map.setRegion(currentRegion, animated: true)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        
        var parent: MyMap
        var map: MKMapView?
        
        init(_ parent: MyMap) {
            self.parent = parent
        }
        
        @objc func didLongPress(gesture: UITapGestureRecognizer) {
            if gesture.state == UIGestureRecognizer.State.began {
                let touchedPoint = gesture.location(in: gesture.view)
                guard let touchedCoordinates = map?.convert(touchedPoint, toCoordinateFrom: map) else {return}
                let newAnnotation = MKPointAnnotation()
                newAnnotation.title = "Tap to see photos"
                newAnnotation.coordinate = CLLocationCoordinate2D(latitude: touchedCoordinates.latitude, longitude: touchedCoordinates.longitude)
                parent.currentAnnotation = newAnnotation
                parent.currentRegion = MKCoordinateRegion(center: newAnnotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            } else {
                return
            }
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            parent.showPhotoGrid = true
        }
    }
    
}
