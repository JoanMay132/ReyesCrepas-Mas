//
//  Bundle-Decodable.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 21/12/24.
//

import Foundation

    extension Bundle {
        func decode(_ file: String) -> [String: Frappes] {
            guard let url = self.url(forResource: file, withExtension: nil) else {
                fatalError("Failed to locate \(file) in the bundle")
            }
            guard let data = try? Data(contentsOf: url) else {
                fatalError("Failed to load \(file)")
            }
            
            let decoder = JSONDecoder()
            
            do {
                return try decoder.decode([String: Frappes].self, from: data)
            }catch DecodingError.keyNotFound(let key, let context) {
                fatalError("Failed to decode \(file) from bundle to missing key '\(key.stringValue)' - \(context.debugDescription)")
            }catch DecodingError.typeMismatch(_, let context) {
                fatalError("Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
            }catch DecodingError.valueNotFound(let type, let context) {
                fatalError("Failed to decode \(file) from bundle due to missing value of type '\(type)' - \(context.debugDescription)")
            }catch DecodingError.dataCorrupted(_) {
                fatalError("Failed to decode \(file) from bundle because if appears to be invalid JSON")
            }catch {
                fatalError("Failed to decode \(file) from bundle due to error: \(error.localizedDescription)")
            }
            
            
        }
    }
