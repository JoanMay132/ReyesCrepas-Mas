//
//  WhatsappViewModel.swift
//  Reyes Crepas
//
//  Created by Joan May on 26/09/25.
//

import Firebase
import FirebaseFirestore

class WhatsappViewModel: ObservableObject {
    @Published var messages: [WhatsappMessage] = []
    @Published var isLoading = true

    private var db = Firestore.firestore()
    
    func getWhatsapp() {
        self.isLoading = true
        
        db.collection("whatsappMessage").addSnapshotListener { snapshot, error in
            if let error = error {
                print(error)
                DispatchQueue.main.async { self.isLoading = false }
                return
            }
            
            guard let snapshot = snapshot else {
                DispatchQueue.main.async { self.isLoading = false }
                return
            }
            
            // Procesa los datos en background
            let newMessages = snapshot.documents.compactMap { doc -> WhatsappMessage? in
                try? doc.data(as: WhatsappMessage.self)
            }
            
            // Solo actualiza @Published si cambió
            DispatchQueue.main.async {
                if self.messages != newMessages {
                    self.messages = newMessages
                }
                self.isLoading = false
            }
        }
    }

    

    func sendOrder(order: String, total: String) {
        guard let whatsappMessage = messages.first else {
            print("No se encontró mensaje de whatsapp")
            return
        }

        let message = "\(whatsappMessage.message) \(order). Total: $\(total)"
        let urlString = "https://wa.me/\(whatsappMessage.number)?text=\(message)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        print("Link de WhatsApp: \(urlString ?? "error")")

        if let urlString = urlString, let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}
