//
//  Tapioca.swift
//  Reyes Crepas
//
//  Created by Joan May on 21/01/25.
//

import Foundation

struct Tapioca : Identifiable, Codable, Hashable {
    let id : String
    let tapioca_type : String
    let tapioca_drinks : [TapiocaDrinks]
    
    struct TapiocaDrinks : Codable, Hashable, Identifiable{
        let id : String
        let name : String
        let size : [DrinkSize]
        
        struct DrinkSize : Codable, Hashable{
            let type : String
            let price : String
            
        }
    }

}
