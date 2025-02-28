//
//  PancakeViewModel.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/02/25.
//

import Firebase
import FirebaseFirestore

class PancakeViewModel: ObservableObject {
    @Published var pancakes: [Pancake] = []
    
    private var db = Firestore.firestore()
    
    // Función para obtener productos desde Firestore
    func fetchProducts() {
        db.collection("pancakes").getDocuments { snapshot, error in
            if let error = error {
                print("Error al obtener productos: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                // Depura los datos recibidos
                snapshot?.documents.forEach { doc in
                    print(doc.data()) // Verifica que los datos del documento son correctos
                }
                
                // Mapeamos los documentos de Firestore a objetos Product
                self.pancakes = snapshot?.documents.compactMap { doc -> Pancake? in
                    do {
                        return try doc.data(as: Pancake.self)
                    } catch {
                        print("Error al decodificar producto: \(error.localizedDescription)")
                        return nil
                    }
                } ?? []
            }
        }
    }
}

