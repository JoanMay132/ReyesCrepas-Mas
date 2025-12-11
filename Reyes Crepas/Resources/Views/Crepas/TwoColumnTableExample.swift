//
//  TwoColumnTableExample.swift
//  Reyes Crepas
//
//  Created by Joan May on 13/11/25.
//



import SwiftUI

struct Producto: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let price: Double
}

struct FilteredTableView: View {
    // Datos de ejemplo
    let products: [Producto] = [
        Producto(name: "Crepa Nutella", category: "Clásicos", price: 65),
        Producto(name: "Crepa Fresa", category: "Clásicos", price: 60),
        Producto(name: "Crepa Oreo Premium", category: "Premium", price: 85),
        Producto(name: "Crepa Kinder Bueno", category: "Premium", price: 90)
    ]

    // Categorías posibles
    let categories = ["Clásicos", "Premium"]

    // Categoría seleccionada
    @State private var selectedCategory = "Clásicos"

    var body: some View {
        VStack {
            // Picker para seleccionar categoría
            Picker("Categoría", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            // Tabla o lista filtrada según la selección
            List(filteredProducts) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Text("$\(product.price, specifier: "%.2f")")
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Menú de Crepas")
    }

    // Computed property: devuelve solo los productos de la categoría elegida
    var filteredProducts: [Producto] {
        products.filter { $0.category == selectedCategory }
    }
}

#Preview {
    FilteredTableView()
}
