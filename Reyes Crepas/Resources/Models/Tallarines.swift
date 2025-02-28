//
//  Tallarines.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/01/25.
//

import Foundation
import Firebase
import FirebaseFirestore
struct Tallarines : Codable, Hashable, Identifiable, Equatable {
    
    @DocumentID var id : String?
    let name : String
    let price : String
    let description : String
    
    var imageName : String {
        return name
    }
}
