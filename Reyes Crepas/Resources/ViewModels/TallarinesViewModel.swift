//
//  TallarinesViewModel.swift
//  Reyes Crepas
//
//  Created by Joan May on 27/02/25.
//


import Firebase
import FirebaseFirestore

class TallarinesViewModel: ObservableObject {
    @Published var tallarines: [Tallarines] = []
    
    private var db = Firestore.firestore()
    
    // Función para obtener productos desde Firestore
    func fetchProducts() {
        db.collection("tallarines").addSnapshotListener { snapshot, error in
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
                self.tallarines = snapshot?.documents.compactMap { doc -> Tallarines? in
                    do {
                        return try doc.data(as: Tallarines.self)
                    } catch {
                        print("Error al decodificar producto: \(error.localizedDescription)")
                        return nil
                    }
                } ?? []
            }
        }
    }
}

