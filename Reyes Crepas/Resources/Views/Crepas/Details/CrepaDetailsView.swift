//
//  CrepaDetailsView.swift
//  Reyes Crepas
//
//  Created by JoanMay132 on 11/12/25.
//

import SwiftUI
import UIKit

struct CrepaDetailsView: View {
    let crepa: MenuItem
    let especialidad: MenuItem.Especialidad
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedQuantity: [MenuItem: Int] = [:]

    @State private var navigateToContentView = false

    var body: some View {

            ScrollView {
                VStack {
                    ProductDetailsView(imageName: especialidad.imagePath ,productName: "Crepa de \(especialidad.name)", productPrice: especialidad.price, productDescription: especialidad.description)
        
                    VStack {
                        // El usuario desea más crepas?
                        quantitySelector()
                        
                        // Add to cart button and going to contentView
                        
                        AddToCartButtonView(
                            productName: "Crepa de \(especialidad.name)",
                            productPrice: especialidad.price,
                            itemsQuantity: [
                                ItemsQuantity(
                                    name: especialidad.name,
                                    price: especialidad.price,
                                    quantity: selectedQuantity[crepa] ?? 1
                                )
                            ], productSize: "",
                            extras: [],
                            cartManager:
                                cartManager, navigateToContentView: $navigateToContentView
                        )
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 8))
                    .frame(maxWidth: .infinity)
       
                }

            }
            .pinkCakeBackground()
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
        
    }
    

}

// MARK: - 🔢 Select quantity
private extension CrepaDetailsView {
    func quantitySelector() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text("¿Cuántas crepas deseas?")
                    .foregroundStyle(.black)

                MinusButtonView(action: { decreaseQuantity(for: crepa) })
                
                Text("\(selectedQuantity[crepa] ?? 1)")
                    .textItemsStyleModifier()
                
                // Plus Button to add more items to our cart
                PlusButtonView(action: { increaseQuantity(for: crepa) })
           

   


            }
            .padding()
        }
    }
}




// MARK: - 🔼  Increase crepas Quantity
private extension CrepaDetailsView {
    func increaseQuantity(for crepa: MenuItem) {
        let currentQuantity = selectedQuantity[crepa, default: 1]
        if currentQuantity < 20 {
            selectedQuantity[crepa] = currentQuantity + 1
        }
    }
}

// MARK: - 🔽 Decrease crepas Quantity
private extension CrepaDetailsView {
    func decreaseQuantity(for crepa: MenuItem) {
        if let currentQuantity = selectedQuantity[crepa], currentQuantity > 1 {
            selectedQuantity[crepa] = currentQuantity - 1
        }
    }
}



