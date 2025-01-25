//
//  Untitled.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 21/12/24.
//

import Foundation
import SwiftUI

// Enum of ProductType
enum ProductTypes: String, Codable {
    case frappe = "Frappes"
    case tapiocas = "Tapiocas"
    case pancakes = "Pancakes" 
//    case otro = "Otro"
}

struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let productType: String
    
    var displayName: String {
        productType
    }
    
    var image: String {
        return productType
    }
}


 
