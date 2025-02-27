//
//  Untitled.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 21/12/24.
//

import Foundation
import Firebase
import FirebaseFirestore

// Enum de tipos de productos
enum ProductTypes: String, Codable {
    case frappe = "Frappes"
    case tapiocas = "Tapiocas"
    case pancakes = "Pancakes"
    case crepas = "Crepas"
    case barraDeCafe = "Barra de Café"
    case tallarines = "Tallarines"
}

struct Product: Codable, Identifiable, Hashable {
    @DocumentID var id: String?        // El ID se obtiene de Firestore
    let product_id: Int             // El ID del producto desde Firestore
    let productType: ProductTypes      // Tipo de producto (Frappes, Tapiocas, etc.)
    
    // Computed property para mostrar el nombre del producto
    var displayName: String {
        return productType.rawValue
    }
    
    // Computed property para usar el tipo de producto como nombre de imagen
    var image: String {
        return productType.rawValue
    }
}
