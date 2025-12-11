//
//  PancakesDetailsView.swift
//  Reyes Crepas
//
//  Created by David Chong on 2/25/25.
//

import SwiftUI

struct PancakesDetailsView: View {
    var pancake: MenuItem
    
    @State private var selectedQuantity: [MenuItem: Int] = [:]
    
    @EnvironmentObject var cartManager: CartManager
    
    @State private var navigateToContentView = false


    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProductDetailsView(productImageName: pancake.name ?? "default", productName: pancake.name ?? "default", productPrice: pancake.price, productDescription: pancake.description)
                    
                    // Información sobre el pancake (sin extras)
                    quantitySelector()
                    
                    AddToCartButtonView(
                        productName: "Pancake de \(pancake.name ?? "default")",
                        productPrice: pancake.price ?? "default",
                        itemsQuantity: selectedQuantity.isEmpty ? [] : [
                            ItemsQuantity(name: pancake.name ?? "default", price: pancake.price ?? "default", quantity: selectedQuantity[pancake] ?? 1)], productSize: "",
                        extras : [],
                        cartManager: cartManager,
                        navigateToContentView: $navigateToContentView
                    )
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationBackButtonView(title : "Pancakes")

                    }
                }
            }
            .pinkCakeBackground()
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
        }
    }
    

    

}


// MARK: - 🔢 Select quantity
private extension PancakesDetailsView {
    func quantitySelector() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text("¿Cuántos pancakes desea?")

                // Plus Button to add more items to our cart
                PlusButtonView(action: { increaseQuantity(for: pancake) })
           

                Text("\(selectedQuantity[pancake] ?? 1)")
                    .textItemsStyleModifier()
                
                MinusButtonView(action: { decreaseQuantity(for: pancake) })

            }
            .padding()
        }
    }
}



// MARK: - 🔼  Increase Pancakes Quantity

private extension PancakesDetailsView {
    func increaseQuantity(for pancake: MenuItem) {
        let currentQuantity = selectedQuantity[pancake, default: 1]
        if currentQuantity < 20 {
            selectedQuantity[pancake] = currentQuantity + 1
        }
    }
}
// MARK: - 🔽 Decrease Tallarines Quantity
private extension PancakesDetailsView {
    func decreaseQuantity(for pancake: MenuItem) {
        if let currentQuantity = selectedQuantity[pancake], currentQuantity > 1 {
            selectedQuantity[pancake] = currentQuantity - 1
        }
    }
}

#Preview {
    let pancake = MenuItem(id: "1", name: "Panchito", price: "$12.00", extras: nil, description: "Delicioso panchito", personalización: nil, especialidades: nil)
    
    PancakesDetailsView(pancake: pancake)
        .environmentObject(CartManager())
}
