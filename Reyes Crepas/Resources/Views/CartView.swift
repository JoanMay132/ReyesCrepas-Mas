//
//  CartView.swift
//  Reyes Crepas
//
//  Created by Joan May on 11/02/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationView {
            VStack {
                if cartManager.items.isEmpty {
                    Text("El carrito está vacío")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(cartManager.items) { item in
                            VStack(alignment: .leading) {
                                itemInfoView(item)
                                itemExtrasView(item)
                                itemTapiocaTypeView(item)
                            }
                        }
                    }
                    
                    // Showing total amount of your cart
                    totalView()
                    checkOutButton()
                }
            }
            .navigationTitle("Carrito")
        }
    }

    private func itemInfoView(_ item: CartItem) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                HStack {
                    Text(item.price)
                    itemProductSize(item)
                    
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                
            }
            Spacer()
            Text("\(item.quantity)")
                .font(.body)
            Button(action: {
                removeItem(item)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
    }

    private func itemExtrasView(_ item: CartItem) -> some View {
        Group {
            // Filtrar los extras que tienen una cantidad mayor que 0
            let validExtras = (item.extras ?? []).filter { $0.quantity > 0 }
            if !validExtras.isEmpty {
                Text("Extras:")
                    .font(.subheadline.bold())
                ForEach(validExtras, id: \.id) { extra in
                    HStack {
                        Text(extra.name)
                            .font(.subheadline)
                        Spacer()
                        Text("\(extra.quantity) x \(extra.price)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
    private func itemTapiocaTypeView(_ item: CartItem) -> some View {
        Group {
            if !item.tapiocaType.isEmpty {
                HStack {
                    Text(item.tapiocaType)
                        .font(.subheadline)
                    Spacer()
                }
            }
        }
    }
    
    private func itemProductSize(_ item: CartItem) -> some View {
        Group {
            if !item.ProductSize.isEmpty {
                HStack {
                    Text("- \(item.ProductSize)")
                        .font(.subheadline)
                    Spacer()
                }
            }
        }
    }
    
    private func checkOutButton() -> some View {
        Button(action: {}) {
            Text("Checkout")
                .buttonStyleModifier()
        }

    }

    private func removeItem(_ item: CartItem) {
        if let index = cartManager.items.firstIndex(where: { $0.id == item.id }) {
            cartManager.removeItem(at: index)
        }
    }

    private func totalView() -> some View {
        VStack {
            Text("Total: \(cartManager.calculateTotal())")
                .font(.title2.bold())
                .padding()
        }
    }
}

#Preview {
    let cartManager = CartManager()
    
    // Agregar algunos elementos de prueba
    cartManager.items = [
        CartItem(
            name: "Tallarines con Pollo",
            price: "$120",
            quantity: 2,
            itemsQuantity: [ItemsQuantity(name: "Salsa extra", price: "$10", quantity: 1)],
            extras : [],
            tapiocaType: "",
            ProductSize: "Grande"
        ),
        CartItem(
            name: "Bubble Tea",
            price: "$85",
            quantity: 1,
            itemsQuantity: [],
            extras: [Extras(name: "Con chocolate", price: "$5", quantity: 1)], // Aquí creamos un objeto `Extras`
            tapiocaType: "Matcha",
            ProductSize: "Mediano"
        )
    ]
    
    return CartView()
        .environmentObject(cartManager) // Pasamos el cartManager al entorno
}
