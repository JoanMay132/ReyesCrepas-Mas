//
//  CoffeeDetailsView.swift
//  Reyes Crepas
//
//  Created by Joan May on 31/01/25.
//

import SwiftUI

struct FrappeDetailsView: View {
    let frappe: Frappe
    let extra: [Frappe.Extra]
    @StateObject private var extrasManager = ExtrasSelectionManager<Frappe.Extra>()
    @EnvironmentObject var cartManager: CartManager

    @State private var selectedExtras: [Frappe.Extra: Int] = [:]
    @State private var navigateToContentView = false 
//    private var selectedExtrasList: [Extras] {
//        selectedExtras.compactMap { (extra, quantity) in
//            quantity > 0 ? Extras(name: extra.name, price: extra.price, quantity: quantity) : nil
//        }
//    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProductDetailsView(productImageName: frappe.name,productName: "Frappé de \(frappe.name)", productPrice: frappe.price, productDescription: nil)
                    
                    // Calling method to show all the extras list in Frappe Details View
                    ExtrasListView(
                        title: "Elige tus extras",
                        extras: frappe.extras,
                        getName: {$0.name},
                        getPrice: {$0.price},
                        onSelect: { extra in
                            extrasManager.selectQuantity(for: extra)
                        })
                        
                        // Add to cart button and going to contentView
            
                    AddToCartButtonView(
                        productName: "Frappé de \(frappe.name)",
                                       productPrice: frappe.price,
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
    let frappe = Frappe(id: "1", name: "Café Mocha", price: "$5.00", extras: [
        Frappe.Extra(id: 1, name: "Leche", price: "$0.50"),
        Frappe.Extra(id: 2, name: "Chocolate", price: "$1.00"),
        Frappe.Extra(id: 3, name: "chookie", price: "$3.00")
    ])
    let extra = frappe.extras
    
    return FrappeDetailsView(frappe: frappe, extra: extra)
        .environmentObject(CartManager())
}
