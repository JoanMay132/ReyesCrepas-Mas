//
//  TapiocaViewModel.swift
//  Reyes Crepas
//
//  Created by Joan May on 27/02/25.
//


import Firebase
import FirebaseFirestore

class TapiocaViewModel: ObservableObject {
    @Published var tapiocas: [Tapioca] = []
    
    private var db = Firestore.firestore()
    
    // Función para obtener productos desde Firestore
    func fetchProducts() {
        db.collection("tapiocas").getDocuments { snapshot, error in
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
                self.tapiocas = snapshot?.documents.compactMap { doc -> Tapioca? in
                    do {
                        return try doc.data(as: Tapioca.self)
                    } catch {
                        print("Error al decodificar producto: \(error.localizedDescription)")
                        return nil
                    }
                } ?? []
            }
        }
    }
}

