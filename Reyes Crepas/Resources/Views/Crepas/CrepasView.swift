//
//  CrepasView.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/25/25.


import SwiftUI

struct CrepasView: View {
    @StateObject private var viewModel = MenuViewModel()
    let categories = ["Clásicos", "Premium"]
    @State private var selectedCategory = "Clásicos"
    
    @State private var selectedIngredients: [String] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                crepasEspecialidadesSection()
                crepasPersonalizacionSection()
            }
            .padding(.bottom, 40)
        }
        .pinkCakeBackground()
        .onAppear {
            viewModel.fetchProducts(from: "crepas")
        }
    }
}

private extension CrepasView {
    
    // MARK: - Especialidades
    func crepasEspecialidadesSection() -> some View {
        VStack(alignment: .leading) {
            Text("Especialidades")
                .productTitleStyleModifier()
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.items.flatMap { $0.especialidades ?? [] }) { especialidad in
                        crepaCard(for: especialidad)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    func crepaCard(for especialidad: MenuItem.Especialidad) -> some View {
        VStack {
            Image(especialidad.name)
                .productImageStyle()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(especialidad.name)
                    .font(.headline)
                    .foregroundStyle(.black)
                Text(especialidad.price)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            .productStyleVStack()
        }
        .paddingProductList()
        .shapeProduct()
    }
    
    // MARK: - Personalización
    func crepasPersonalizacionSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Personaliza tu crepa")
                .productTitleStyleModifier()
                .padding(.horizontal)
            
            VStack {
                Text("Selecciona de 1 a 2 ingredientes")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            
            // Picker de categorías de crepas
            Picker("Categoría", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
            .pickerStyle(.segmented)
            .background(Color.white)
            
            // Productos con personalización
            ForEach(viewModel.items.compactMap { $0.personalización }) { personalizacion in
                let ingredientsToShow = selectedCategory == "Clásicos" ?
                    personalizacion.ingredientes.clasicos :
                    personalizacion.ingredientes.premium
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8) {
                        ForEach(ingredientsToShow, id: \.self) { ingrediente in
                            IngredientRow(
                                ingrediente: ingrediente,
                                selectedIngredients: $selectedIngredients
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .background(Color.white)
                .padding(.horizontal)
            }
            //............
            //Elige tu topping
            VStack {
                Text("Elige tu topping")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            
            
            // Picker de categorías de crepas
            Picker("Categoría", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
            .pickerStyle(.segmented)
            .background(Color.white)
            
        }
    }
}

// MARK: - Fila de ingrediente con checkbox
struct IngredientRow: View {
    let ingrediente: String
    @Binding var selectedIngredients: [String]
    
    var body: some View {
        let isChecked = selectedIngredients.contains(ingrediente)
        let isDisabled = !isChecked && selectedIngredients.count >= 2
        
        HStack {
            Text(ingrediente)
                .padding(.leading, 8)
            
            Spacer()
            
            CheckBoxViewxd(
                isChecked: isChecked,
                isDisabled: isDisabled,
                action: {
                    if isChecked {
                        selectedIngredients.removeAll { $0 == ingrediente }
                    } else if selectedIngredients.count < 2 {
                        selectedIngredients.append(ingrediente)
                    }
                }
            )
        }
        .background(Color.white)
        .cornerRadius(8)

        .opacity(isDisabled ? 0.5 : 1) // los deshabilitados se ven más claros
        .disabled(isDisabled) // no se puede tocar
    }
}

// MARK: - Checkbox
struct CheckBoxViewxd: View {
    var isChecked: Bool = false
    var isDisabled: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            if !isDisabled {
                action()
            }
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .foregroundColor(isDisabled ? .gray : .green)
                .font(.title2)
        }
        .disabled(isDisabled)
    }
}

#Preview {
    CrepasView()
}
