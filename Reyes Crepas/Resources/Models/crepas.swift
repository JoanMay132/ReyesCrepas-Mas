//
//  Crepas.swift
//  Reyes Crepas
//
//  Created by David Chong on 2/25/25.
//

import Foundation

struct Crepas: Identifiable, Codable, Hashable {
    
    struct Extra: Identifiable, Codable, Hashable {
        let id: Int
        let name: String
       
    }
    
    let id: String
    let name: String
  
   
    
    var image: String {
        name
    }
}

