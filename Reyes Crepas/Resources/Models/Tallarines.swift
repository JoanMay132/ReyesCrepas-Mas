//
//  Tallarines.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/01/25.
//

import Foundation
struct Tallarines : Codable, Hashable, Identifiable, Equatable {
    
    let id : String
    let name : String
    let price : String
    let description : String
    
    var image : String {
        return "tallarines_\(id)"
    }
}
