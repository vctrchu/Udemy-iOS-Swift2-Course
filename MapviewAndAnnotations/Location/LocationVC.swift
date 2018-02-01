//
//  SecondViewController.swift
//  Location
//
//  Created by VICTOR CHU on 2018-01-26.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    
    let regionRadius: CLLocationDistance = 1000
    
    let addresses = [
        "One Infinite Loop, Cupertino, CA 95014, USA",
        "10625 N De Anza Blvd, Cupertino, CA 95014, USA",
        "10889 N De Anza Blvd, Cupertino, CA 95014, USA"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
        
        for add in addresses {
            getPlacemarkFromAddress(address: add)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //Displays user location if authorized
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            map.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    //Zooms in user location on map
    func centerMapOnLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if let loc = userLocation.location {
            centerMapOnLocation(location: loc)
        }
    }
    
    //Intercepts pindrop annotation before placed (customization)
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        if annotation.isKind(of: Annotation.self) {
            let annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Default")
            //annoView.pinTintColor = UIColor.blue
            annoView.animatesDrop = true
            return annoView
        } else if (annotation.isKind(of: MKUserLocation.self)) {
            return nil
        }

        return nil
    }
    
    //Adds geocoded location from getPlacemarkFromAddress to map
    func createAnnotationsForLocation(location: CLLocation) {
        let annotation = Annotation(coordinate: location.coordinate)
        
        map.addAnnotation(annotation)
    }
    
    //Converts string location to coordinates
    func getPlacemarkFromAddress(address: String) {
        CLGeocoder().geocodeAddressString(address) {
            (placemarks, error ) in
            
            if let marks = placemarks, marks.count > 0 {
                if let loc = marks[0].location {
                    //We have a valid location with coordinates
                    self.createAnnotationsForLocation(location: loc)
                    
                }
            }
            
        }
    }
    
    
    
    
    
    
    
}

