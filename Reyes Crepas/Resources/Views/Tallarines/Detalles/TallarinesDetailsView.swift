//
//  TallarinesDetailsView.swift
//  Reyes Crepas
//
//  Created by Joan May on 05/02/25.
//

import SwiftUI

struct TallarinesDetailsView: View {
    var tallarines: MenuItem
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToContentView = false
    @State private var selectedQuantity: [MenuItem: Int] = [:]

    var body: some View {
        ScrollView {
            VStack {
                
                ProductDetailsView(productImageName: tallarines.name ?? "default",productName: tallarines.name ?? "default", productPrice: tallarines.price, productDescription: tallarines.description)
                
                quantitySelector()
                
                AddToCartButtonView(
                    productName: "Tallarin de \(tallarines.name ?? "default")",
                    productPrice: tallarines.price ?? "dault",
                    itemsQuantity: selectedQuantity.isEmpty ? [] : [
                        ItemsQuantity(name: tallarines.name ?? "default", price: tallarines.price ?? "default", quantity: selectedQuantity[tallarines] ?? 1)], productSize: "",
                    extras : [],
                    cartManager: cartManager,
                    navigateToContentView: $navigateToContentView
                )
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBackButtonView(title : "Tallarines")
                }
            }
        }
        .pinkCakeBackground()
        .navigationDestination(isPresented: $navigateToContentView) {
            ContentView()
        }
    }
}




// MARK: - 🔢 Select quantity
private extension TallarinesDetailsView {
    func quantitySelector() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text("¿Cuántos tallarines deseas?")
                
                // Plus Button to add more items to our cart
                PlusButtonView(action: { increaseQuantity(for: tallarines) })
           

                Text("\(selectedQuantity[tallarines] ?? 1)")
                    .textItemsStyleModifier()
                
                MinusButtonView(action: { decreaseQuantity(for: tallarines) })

            }
            .padding()
        }
    }
}




// MARK: - 🔼  Increase Tallarines Quantity
private extension TallarinesDetailsView {
    func increaseQuantity(for tallarines: MenuItem) {
        let currentQuantity = selectedQuantity[tallarines, default: 1]
        if currentQuantity < 20 {
            selectedQuantity[tallarines] = currentQuantity + 1
        }
    }
}

// MARK: - 🔽 Decrease Tallarines Quantity
private extension TallarinesDetailsView {
    func decreaseQuantity(for tallarines: MenuItem) {
        if let currentQuantity = selectedQuantity[tallarines], currentQuantity > 1 {
            selectedQuantity[tallarines] = currentQuantity - 1
        }
    }
}

// MARK: - 👀 Preview View
#Preview {
    let tallarines: [MenuItem] = Bundle.main.decode("tallarines.json")
    if let tallarin = tallarines.first(where: { $0.id == "kinder_fresa" }) {
        TallarinesDetailsView(tallarines: tallarin)
            .environmentObject(CartManager())
    } else {
        Text("Producto no encontrado")
    }
}
