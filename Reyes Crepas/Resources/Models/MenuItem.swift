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
    var esCrepa: Bool {
        name == "Crepas" || name == "Crepa"
    }
    struct Personalizacion : Identifiable, Codable, Hashable {
        let id: Int
        let base_price : Int
        let ingredientes : Ingredientes
        let precios_combinaciones: [PrecioCombinacion]
        let topping : [String]
        let extra_toppings : [Extra_Toppings]
    }
    
    struct Extra_Toppings:  Identifiable, Codable, Hashable {
        let id : Int
        let extra_name: String
        let price: Int
    }
    
    enum IngredientOption: Hashable {
        case simple(String)
        case extra(Extra_Toppings)
        case detailed(name: String, price: Double?)

        var displayName: String {
            switch self {
            case .simple(let name):
                return name

            case .extra(let extra):
                return extra.extra_name

            case .detailed(let name, _):
                return name
            }
        }

        var price: Double {
            switch self {
            case .simple:
                return 0

            case .extra(let extra):
                return Double(extra.price)

            case .detailed(_, let price):
                return price ?? 0
            }
        }
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

