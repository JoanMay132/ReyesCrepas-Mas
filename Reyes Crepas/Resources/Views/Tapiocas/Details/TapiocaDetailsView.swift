//
//  TapiocaDetailsView.swift
//  Reyes Crepas
//
//  Created by Joan May on 04/02/25.
//
import SwiftUI

struct TapiocaDetailsView: View {
    var tapioca: Tapioca
    let tapiocaDrink: Tapioca.TapiocaDrinks
    let tapiocaSize: [Tapioca.TapiocaDrinks.DrinkSize]
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToContentView = false // Estado para controlar la navegación
    @State private var selectedSize: Tapioca.TapiocaDrinks.DrinkSize
    
    init(tapioca : Tapioca, tapiocaDrink : Tapioca.TapiocaDrinks, tapiocaSize : [Tapioca.TapiocaDrinks.DrinkSize]) {
        self.tapioca = tapioca
        self.tapiocaDrink = tapiocaDrink
        self.tapiocaSize = tapiocaSize
        
        if let normalSize = tapiocaSize.first(where : { $0.type == "Normal"}) {
            _selectedSize = State(initialValue: normalSize)

        }else {
            _selectedSize = State(initialValue: tapiocaSize.first ?? tapiocaSize[0])

        }

    }

    var body: some View {
            ScrollView {
                VStack {
                    // Tapioca drink image
                    ProductDetailsView(productImageName: tapiocaDrink.name,productName: "Tapioca de \(tapiocaDrink.name)", productPrice: nil, productDescription: tapioca.tapioca_type)
                    
                    //Method to choose your tapioca Size
                    chooseYourProductSize()
                    
                    AddToCartButtonView(
                        productName: "Tapioca de \(tapiocaDrink.name)",
                                       productPrice: selectedSize.price,
                                       itemsQuantity: [],
                                       extras : [],
                                       cartManager: cartManager,
                                       navigateToContentView: $navigateToContentView
                    )

             
                    
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationBackButtonView(title : "Tapioca")
                    }
                }
            }
            .pinkCakeBackground()
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
        
    }
}

private extension TapiocaDetailsView {
    func chooseYourProductSize() -> some View {
        
        VStack(alignment: .leading) {
            
            Text("Tamaño de tu tapioca")
                .font(.headline)
                .padding(.horizontal)

            Picker("Tamaño de tu tapioca", selection: $selectedSize) {
                ForEach(tapiocaSize, id: \.self) { size in
                    Text("\(size.type) - \(size.price)")
                }
            }
            .pickerStyle(.segmented)
            .padding()
        }
    }
}

#Preview {
    let tapiocaDrink = Tapioca.TapiocaDrinks(
        id: "1",
        name: "Matcha",
        size: [
            Tapioca.TapiocaDrinks.DrinkSize(id: "small", type: "Pequeño", price: "12.00")
        ]
    )
    
    let tapioca = Tapioca(
        id: "1",
        tapioca_type: "Milk",
        tapioca_drinks: [tapiocaDrink]
    )
    
    return TapiocaDetailsView(
        tapioca: tapioca,
        tapiocaDrink: tapiocaDrink,
        tapiocaSize: tapiocaDrink.size
    )
}
