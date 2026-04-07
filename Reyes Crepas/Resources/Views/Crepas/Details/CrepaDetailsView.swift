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
                            itemsQuantity: [], productSize: "",
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




// MARK: - 🔼  Increase Tallarines Quantity
private extension CrepaDetailsView {
    func increaseQuantity(for tallarines: MenuItem) {
        let currentQuantity = selectedQuantity[tallarines, default: 1]
        if currentQuantity < 20 {
            selectedQuantity[crepa] = currentQuantity + 1
        }
    }
}

// MARK: - 🔽 Decrease Tallarines Quantity
private extension CrepaDetailsView {
    func decreaseQuantity(for tallarines: MenuItem) {
        if let currentQuantity = selectedQuantity[crepa], currentQuantity > 1 {
            selectedQuantity[crepa] = currentQuantity - 1
        }
    }
}



