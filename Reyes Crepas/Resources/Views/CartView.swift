//
//  CartView.swift
//  Reyes Crepas
//
//  Created by Joan May on 11/02/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToUserInformationView = false

    var body: some View {
        NavigationStack {
            
            List {
                if cartManager.items.isEmpty {
                    Text("El carrito está vacío")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    
                        ForEach(cartManager.items) { item in
                            VStack(alignment: .leading) {
                                itemInfoView(item)
                                itemExtrasView(item)
                                itemTapiocaTypeView(item)
                            }
                        }
                    
                    totalView()
                     
                    
                    NavigationLink(destination: UserInformationView()){
                        Label("Checkout", systemImage: "cart")
                 
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                    }
                }

            }
            .scrollContentBackground(.hidden)

            .pinkCakeBackground()
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

                    .onAppear {
                        print(" Item en carrito: \(item.name) | Tamaño: \(item.productSize)")
                                          }
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
            if !item.productSize.isEmpty {
                HStack {
                    Text("- \(item.productSize)")
                        .font(.subheadline)
                    Spacer()
                }
            }
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
    let cartManager: CartManager = {
        let cm = CartManager()
        cm.items = [
            CartItem(
                name: "Tallarines con Pollo",
                price: "$120",
                quantity: 2,
                itemsQuantity: [ItemsQuantity(name: "Salsa extra", price: "$10", quantity: 1)],
                extras: [],
                tapiocaType: "",
                productSize: "Grande"
            ),
            CartItem(
                name: "Bubble Tea",
                price: "$85",
                quantity: 1,
                itemsQuantity: [],
                extras: [Extras(name: "Con chocolate", price: "$5", quantity: 1)],
                tapiocaType: "Matcha",
                productSize: "Mediano"
            )
        ]
        return cm
    }()

    NavigationStack {
        CartView()
            .environmentObject(cartManager)
    }
}
