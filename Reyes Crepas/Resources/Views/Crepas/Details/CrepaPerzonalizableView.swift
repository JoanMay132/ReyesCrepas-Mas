//
//  CrepaDetailsView.swift
//  Reyes Crepas
//
//  Created by JoanMay132 on 24/11/25.
//

import SwiftUI

struct CrepaPersonalizableView: View {
    let crepa: MenuItem
    
    let categories = ["Clásicos", "Premium"]
    
    @State private var selectedCategory = "Clásicos"
    @State private var selectedIngredients: [MenuItem.IngredientOption] = []
    @State private var selectedToppings: MenuItem.IngredientOption? = nil
    @State private var selectedExtraToppings: [MenuItem.IngredientOption] = []
    
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToContentView = false
    
    //Si usuario no selecciona ningún topping se pondrá el primero por default
   
    init(crepa: MenuItem) {
        self.crepa = crepa
        
        if let first = crepa.personalización?.topping.first {
            _selectedToppings = State(initialValue: .simple(first))
        }
    }
    // Nombre dinámico basado en selecciones
    var crepaName: String {
        var parts: [String] = []
        parts += selectedIngredients.map { $0.displayName }

        return parts.isEmpty ? crepa.name ?? "Crepa" : "Crepa de " + parts.joined(separator: " y ")
    }
    var isValidSelection: Bool {
        guard crepa.esCrepa else { return true } // <-- si no es crepa, siempre válido
        let count = selectedIngredients.count
        return count >= 1 && count <= 2
    }

    // Precio dinámico basado en selecciones
    var crepaPrice: Double {
        guard let personalizacion = crepa.personalización else { return 0 }
        
        let numClasicos = selectedIngredients.filter {
            if case .simple(let name) = $0 {
                return personalizacion.ingredientes.clasicos.contains(name)
            }
            return false
        }.count
        
        let numPremium = selectedIngredients.filter {
            if case .simple(let name) = $0 {
                return personalizacion.ingredientes.premium.contains(name)
            }
            return false
        }.count
        
        // Buscar combo exacto
        let comboPrice = personalizacion.precios_combinaciones.first(where: {
            $0.clasicos == numClasicos && $0.premium == numPremium
        })?.precio ?? personalizacion.base_price
        
        let extrasPrice = selectedExtraToppings.reduce(0.0) { $0 + Double($1.price) }
    
        
        return Double(comboPrice) + extrasPrice
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                crepasPersonalizacionSection()
                
                AddToCartButtonView(
                    productName: crepaName,
                    productPrice: String(format: "$%.2f", crepaPrice),
                    itemsQuantity: [],
                    productSize: "",
                    extras:
                        (selectedToppings != nil ?
                            [Extras(
                                name: selectedToppings!.displayName,
                                price: "$0.00",
                                quantity: 1
                            )] : []
                        )
                        +
                        selectedExtraToppings.map { extra in
                            Extras(
                                name: extra.displayName,
                                price: String(format: "$%.2f", extra.price),
                                quantity: 1
                            )
                        },
                    cartManager: cartManager,
                    navigateToContentView: $navigateToContentView,
                    isEnabled: selectedIngredients.count >= 1 && selectedIngredients.count <= 2
                )
                          
            }
            .padding(.bottom, 40)
        }
        .pinkCakeBackground()
        .navigationDestination(isPresented: $navigateToContentView) {
            ContentView()
        }
 
    }
    
    // MARK: - Personalización
    @ViewBuilder
    func crepasPersonalizacionSection() -> some View {
        
        if let personalizacion = crepa.personalización {
            // Ingredientes principales
            let ingredientsToShow = selectedCategory == "Clásicos" ?
                personalizacion.ingredientes.clasicos :
                personalizacion.ingredientes.premium
            
        VStack(alignment: .leading, spacing: 12) {
            Text("Personaliza tu crepa")
                .productTitleStyleModifier()
            
            VStack {
                Text("Selecciona de 1 a 2 ingredientes")
                    .productTextStyleModifier()
                Spacer()
                SegmentedSelector(
                    items: categories,
                    titleProvider: {category in category},
                    selectedItem: $selectedCategory
                )

                //showing ingredients type
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8) {
                        ForEach(ingredientsToShow, id: \.self) { ingrediente in
                            IngredientRow(
                                ingrediente: .simple(ingrediente),
                                selectedIngredients: $selectedIngredients,
                                maxSelection: 2
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal)
            }
          
            .vstackStyleModifier()
                
                // Toppings gratis
                VStack {
                    Text("Elige tu topping")
                        .productTextStyleModifier()
                    Spacer()
                    Text("¡UNO GRATIS!")
                        .productTextStyleModifier()
                    Spacer()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            ForEach(personalizacion.topping, id: \.self) { topping in
                                let toppingOption = MenuItem.IngredientOption.simple(topping)
                                Button {
                                    selectedToppings = toppingOption
                                } label: {
                                    Text(topping)
                                        .font(.subheadline.bold())
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .foregroundStyle(selectedToppings == toppingOption ? .white : .black)
                                        .background(selectedToppings == toppingOption ? Color.blue : Color.gray.opacity(0.15))
                                        .clipShape(.rect(cornerRadius: 8))
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                    
                }
                .vstackStyleModifier()
                
          
                
                // Extra toppings
                VStack {
                    Text("Añade topping extra")
                        .productTextStyleModifier()
                    Spacer()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            ForEach(personalizacion.extra_toppings) { extra in
                                IngredientRow(
                                    ingrediente: .extra(extra),
                                    selectedIngredients: $selectedExtraToppings,
                                    maxSelection: 999
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
           

                .vstackStyleModifier()
            }
        }
    }
    
    // MARK: - Ingredient Row
    struct IngredientRow: View {
        let ingrediente: MenuItem.IngredientOption
        @Binding var selectedIngredients: [MenuItem.IngredientOption]
        var maxSelection: Int
        
        var body: some View {
            let isChecked = selectedIngredients.contains(ingrediente)
            let isDisabled = !isChecked && selectedIngredients.count >= maxSelection
            
            HStack {
                Text(ingrediente.displayName)
                    .padding(.leading, 8)
                
                if ingrediente.price > 0 {
                    Text("+$\(Int(ingrediente.price))")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                
                Spacer()
                
                CheckBoxViewxd(
                    isChecked: isChecked,
                    isDisabled: isDisabled,
                    action: {
                        if isChecked {
                            selectedIngredients.removeAll { $0 == ingrediente }
                        } else if selectedIngredients.count < maxSelection {
                            selectedIngredients.append(ingrediente)
                        }
                    }
                )
            }
            .background(Color.white)
            .cornerRadius(8)
            .opacity(isDisabled ? 0.5 : 1)
            .disabled(isDisabled)
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
}

#Preview {
    let samplePersonalizacion = MenuItem.Personalizacion(
        id: 1,
        imagePath: nil,
        base_price: 50,
        ingredientes: MenuItem.Ingredientes(clasicos: ["Chocolate", "Plátano"], premium: ["Nutella", "Fresas"]),
        precios_combinaciones: [],
        topping: ["Crema", "Azúcar Glass"],
        extra_toppings: [MenuItem.Extra_Toppings(id: 1, extra_name: "Almendras", price: 5)]
    )
    
    let sampleCrepa = MenuItem(
        id: "1",
        name: "Crepa",
        imagePath: nil,
        price: nil,
        extras: nil,
        description: nil,
        personalización: samplePersonalizacion,
        especialidades: nil
    )
    
    CrepaPersonalizableView(crepa: sampleCrepa)
        .environmentObject(CartManager())
        
}
