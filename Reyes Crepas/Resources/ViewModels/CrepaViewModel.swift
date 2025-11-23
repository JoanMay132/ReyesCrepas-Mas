//
//  CrepaViewModel.swift
//  Reyes Crepas
//
//  Created by Joan May on 09/11/25.
//

import Firebase
import FirebaseFirestore

class CrepaViewModel: ObservableObject {
    @Published var crepas: [MenuItem] = []
    
    private var db = Firestore.firestore()
    
    // Función para obtener productos desde Firestore
    func fetchProducts() {
        db.collection("crepas").addSnapshotListener { snapshot, error in
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
                self.crepas = snapshot?.documents.compactMap { doc -> MenuItem? in
                    do {
                        return try doc.data(as: MenuItem.self)
                    } catch {
                        print("Error al decodificar producto: \(error.localizedDescription)")
                        return nil
                    }
                } ?? []
            }
        }
    }
}
