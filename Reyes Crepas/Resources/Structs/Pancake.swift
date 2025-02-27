//
//  Pancake.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/24/25.
//

import Foundation

struct Pancake: Identifiable, Codable, Hashable {
    
    struct Extra: Identifiable, Codable, Hashable {
        let id: Int
        let name: String
        let price: String
    }
    
    let id: String
    let name: String
    let price: String
    
    
    var image : String {
        "\(name)"
    }
}

