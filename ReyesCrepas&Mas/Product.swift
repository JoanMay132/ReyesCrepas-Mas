//
//  Untitled.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 21/12/24.
//

import Foundation

struct Products : Codable, Identifiable {
    let id : Int
    let productType : String
    
    var displayName : String {
        productType
    }
    
    var image : String {
        "\(productType)"
    }
}
