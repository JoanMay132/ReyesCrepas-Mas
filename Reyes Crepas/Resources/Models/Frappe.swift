//
//  Frappes.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 21/12/24.
//


import Foundation

struct Frappe: Identifiable, Codable, Hashable {
    
    struct Extra: Identifiable, Codable, Hashable {
        let id: Int
        let name: String
        let price: String
    }
    
    let id: String
    let name: String
    let price: String
    let extras: [Extra]
    
    var image: String {
        name
    }
}



