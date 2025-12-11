//
//  MenuViewModel.swift
//  Reyes Crepas
//
//  Created by Joan May on 02/11/25.
//

import Firebase
import FirebaseFirestore

// View Model to deprecate all view models products

class MenuViewModel : ObservableObject {
    
    @Published var items : [MenuItem] = []
    
    private var db = Firestore.firestore()
    
    //Función para obtener productos de firebase
    func fetchProducts(from collection : String) {
        db.collection(collection).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print("Error al obtener productos: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                //Depura los datos recibidos.
                self.items = snapshot?.documents.compactMap { doc -> MenuItem? in
                    do {
                        return try doc.data(as: MenuItem.self)
                    }catch {
                        print("Error al decodificar producto de \(collection): \(error.localizedDescription)")
                        print("Datos crudos del doc que falló: \(doc.data())")
                                       return nil
                    }
                } ?? []
            }
        }
    }
}
