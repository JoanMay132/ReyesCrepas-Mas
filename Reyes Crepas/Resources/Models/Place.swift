//
//  Place.swift
//  Reyes Crepas
//
//  Created by Joan May on 07/10/25.
//

import Foundation

import CoreLocation

struct Place : Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    static let reyesCrepas = Place(name: "Reyes Crepas", coordinate: CLLocationCoordinate2D(latitude: 18.654550895170523, longitude: -91.82097186207052))

}
