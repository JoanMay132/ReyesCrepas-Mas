//
//  Pancake.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/24/25.
//

import Foundation
import FirebaseFirestore
import Firebase
struct Pancake: Identifiable, Codable, Hashable {
    
    @DocumentID var id: String?
    let name: String
    let price: String
    let description: String
    
    
    var imageName : String {
        name
    }
}

