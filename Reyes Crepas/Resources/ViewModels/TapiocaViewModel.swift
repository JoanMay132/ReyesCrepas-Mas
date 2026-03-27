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
        db.collection("tapiocas").addSnapshotListener { snapshot, error in
            
            if let error = error {
                print("Error al obtener productos: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                
                self.tapiocas = snapshot?.documents.compactMap { doc -> Tapioca? in
                    do {
                        return try doc.data(as: Tapioca.self)
                    } catch {
                        print("Error al decodificar producto: \(error.localizedDescription)")
                        return nil
                    }
                } ?? []
                
                // 🔥 Limpiar imágenes anteriores
          
                // 🔥 Resolver imágenes
                Task {
                    await self.resolveImages()
                }
            }
        }
    }
    
    // 🔥 Igual que en MenuViewModel pero adaptado
    private func resolveImages() async {
        for tapioca in tapiocas {
            for drink in tapioca.tapioca_drinks {
                
                let id = drink.id
                let path = drink.imagePath
                
                print("🔄 Cargando imagen tapioca:", path ?? "null")
         
            }
        }
    }
}
