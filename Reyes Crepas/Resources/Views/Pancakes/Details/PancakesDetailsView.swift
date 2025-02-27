//
//  PancakesDetailsView.swift
//  Reyes Crepas
//
//  Created by David Chong on 2/25/25.
//

import SwiftUI

struct PancakesDetailsView: View {
    var pancake: Pancake
    @State private var selectedQuantity: [Pancake: Int] = [:]
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToContentView = false


    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProductDetailsView(productID: pancake.id,productName: pancake.name, productPrice: pancake.price, productDescription: pancake.description)
                    
                    // Información sobre el pancake (sin extras)
                    quantitySelector()
                    
                    AddToCartButtonView(
                        productName: "Pancake de \(pancake.name)",
                        productPrice: pancake.price,
                        itemsQuantity: selectedQuantity.isEmpty ? [] : [
                            ItemsQuantity(name: pancake.name, price: pancake.price, quantity: selectedQuantity[pancake] ?? 1)],
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
    func increaseQuantity(for pancake: Pancake) {
        let currentQuantity = selectedQuantity[pancake, default: 1]
        if currentQuantity < 20 {
            selectedQuantity[pancake] = currentQuantity + 1
        }
    }
}
// MARK: - 🔽 Decrease Tallarines Quantity
private extension PancakesDetailsView {
    func decreaseQuantity(for pancake: Pancake) {
        if let currentQuantity = selectedQuantity[pancake], currentQuantity > 1 {
            selectedQuantity[pancake] = currentQuantity - 1
        }
    }
}

#Preview {
    let pancakes: [Pancake] = Bundle.main.decode("pancakes.json")
    if let pancake = pancakes.first(where: { $0.id == "tocineta_pancake" }) {
        return PancakesDetailsView(pancake: pancake)
            .environmentObject(CartManager())
    } else {
        return Text("Pancake not found")
    }
}
