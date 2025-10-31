//
//  WhatsappMessage.swift
//  Reyes Crepas
//
//  Created by Joan May on 26/09/25.
//

import Foundation
import FirebaseFirestore
import Firebase
struct WhatsappMessage : Identifiable, Codable, Hashable{
    @DocumentID var id : String?

    var message : String
    var number : String
}
