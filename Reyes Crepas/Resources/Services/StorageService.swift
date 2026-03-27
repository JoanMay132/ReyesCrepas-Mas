//
//  StorageService.swift
//  Reyes Crepas
//
//  Created by JoanMay132 on 15/02/26.
//

import FirebaseStorage
import Foundation

final class StorageService {
    
    static let shared = StorageService()
    private init() {}
    
    private let storage = Storage.storage()
    
    func getImageURL(from path: String) async throws -> URL {
        let ref = storage.reference(withPath: path)
        return try await ref.downloadURL()
    }
}
