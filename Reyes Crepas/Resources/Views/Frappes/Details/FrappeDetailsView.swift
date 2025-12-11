//
//  CoffeeDetailsView.swift
//  Reyes Crepas
//
//  Created by Joan May on 31/01/25.
//

import SwiftUI

struct FrappeDetailsView: View {
    let frappe: MenuItem
    let extra: [MenuItem.Extra]
    @StateObject private var extrasManager = ExtrasSelectionManager<MenuItem.Extra>()
    @EnvironmentObject var cartManager: CartManager

    @State private var selectedExtras: [MenuItem.Extra: Int] = [:]
    @State private var navigateToContentView = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProductDetailsView(productImageName: frappe.name ?? "default",productName: "Frappé de \(frappe.name ?? "default")", productPrice: frappe.price, productDescription: nil)
                    
                    // Calling method to show all the extras list in Frappe Details View
                    ExtrasListView(
                        title: "Elige tus extras",
                        extras: extra,
                        getName: {$0.name},
                        getPrice: {$0.price},
                        onSelect: { extra in
                            extrasManager.selectQuantity(for: extra)
                        })
                        
                        // Add to cart button and going to contentView
            
                    AddToCartButtonView(
                        productName: "Frappé de \(frappe.name ?? "default")",
                        productPrice: frappe.price ?? "default",
                        itemsQuantity: [], productSize: "",
                        extras:
                            extrasManager.selectedExtras.map { extra, quantity in
                            Extras(name: extra.name, price: extra.price, quantity: quantity)
                            },
                        cartManager:
                            cartManager, navigateToContentView: $navigateToContentView
                    )
       
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationBackButtonView(title: "Frappes")
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



#Preview {
    let frappe = MenuItem(id: "1", name: "Café Mocha", price: "$5.00", extras: [
        MenuItem.Extra(id: 1, name: "Leche", price: "$0.50"),
        MenuItem.Extra(id: 2, name: "Chocolate", price: "$1.00"),
        MenuItem.Extra(id: 3, name: "chookie", price: "$3.00")
    ],
                          description: nil, personalización: nil,
                          especialidades: nil)
    
    
    FrappeDetailsView(frappe: frappe, extra: frappe.extras ?? [])
        .environmentObject(CartManager())
}
