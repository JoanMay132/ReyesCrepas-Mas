//
//  Frappes.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 21/12/24.
//


import Foundation
import FirebaseFirestore


struct Frappe: Identifiable, Codable, Hashable {
    struct Extra: Identifiable, Codable, Hashable {
        let id: Int
        let name: String
        let price: String
    }
    
    @DocumentID var id: String?  // Cambiar a opcional, ya que Firestore genera el id automáticamente
    let name: String
    let price: String
    let extras: [Extra]
    
    var image: String {
        return name // Asigna el nombre como imagen, puedes cambiar esto a una URL o path si es necesario
    }
}
