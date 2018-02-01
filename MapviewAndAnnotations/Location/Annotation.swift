//
//  Annotation.swift
//  Location
//
//  Created by VICTOR CHU on 2018-01-26.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
}
