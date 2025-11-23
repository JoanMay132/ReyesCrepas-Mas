//
//  MenuItem.swift
//  Reyes Crepas
//
//  Created by Joan May on 02/11/25.
//

import Foundation
import FirebaseFirestore

struct MenuItem: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let name: String?
    let price: String?
    let extras: [Extra]?
    let description: String?
    //Personalización crepas
    let personalización : Personalizacion?
    
    var imageName: String { name ?? "" }
    
   // MARK: Especialidades de crepas
    let especialidades : [Especialidad]?
    
    struct Personalizacion : Identifiable, Codable, Hashable {
        let id: Int
        let base_price : Int
        let ingredientes : Ingredientes
        let precios_combinaciones: [PrecioCombinacion]
        let topping : [String]
    }
    
    struct Ingredientes : Codable, Hashable {
        let clasicos : [String]
        let premium : [String]
    }

    
    struct PrecioCombinacion: Codable, Hashable {
        let clasicos: Int
        let premium: Int
        let precio: Int
    }
    
    
    
    struct Extra: Identifiable, Codable, Hashable {
        let id: Int
        let name: String
        let price: String
    }
    
    struct Especialidad: Codable, Hashable, Identifiable {
        let id: Int
        let name: String
        let price: String
        let description: String
    }
}

    //MARK: -- This struct must be here when we update our database to mongo
    
  //  let tapioca: Tapioca? // Solo los productos tapioca lo tendrán
//    struct Tapioca: Codable, Hashable, Identifiable {
//        let id: String
//        let tapioca_type: String
//        let tapioca_drinks: [TapiocaDrink]
//        
//        struct TapiocaDrink: Codable, Hashable, Identifiable {
//            let id: String
//            let name: String
//            let size: [DrinkSize]
//            
//            struct DrinkSize: Codable, Hashable, Identifiable {
//                let id: String
//                let type: String
//                let price: String
//            }
//        }
//    }
