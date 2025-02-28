//
//  BarraDeCafeViewModel.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/02/25.
//

import Firebase
import FirebaseFirestore

class BarraDeCafeViewModel: ObservableObject {
    @Published var barraDeCafe: [BarraDeCafe] = []
    
    private var db = Firestore.firestore()
    
    // Función para obtener productos desde Firestore
    func fetchProducts() {
        db.collection("barra_de_cafe").getDocuments { snapshot, error in
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
                self.barraDeCafe = snapshot?.documents.compactMap { doc -> BarraDeCafe? in
                    do {
                        return try doc.data(as: BarraDeCafe.self)
                    } catch {
                        print("Error al decodificar producto: \(error.localizedDescription)")
                        return nil
                    }
                } ?? []
            }
        }
    }
}

