//
//  barraDeCafe.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/27/25.
//
import Foundation
import Firebase
import FirebaseFirestore
struct BarraDeCafe: Identifiable, Codable, Hashable {
    
    struct Extra: Identifiable, Codable, Hashable {
        let id: Int
        let name: String
        let price: String
    }
    
    @DocumentID var id: String?
    let name: String
    let price: String
    let extras: [Extra]
    
    var imageName: String {
        name
    }
}
