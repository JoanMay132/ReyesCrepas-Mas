//
//  Frappes.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 21/12/24.
//

import Foundation


struct Frappes: Identifiable, Codable {
    
    struct Extra: Identifiable, Codable {
        let id: Int
        let name: String
        let price: String
    }
    
    let id: String
    let name: String
    let price: String
    let extras: [Extra]
    
    var image : String {
        "\(name)"
    }
}


