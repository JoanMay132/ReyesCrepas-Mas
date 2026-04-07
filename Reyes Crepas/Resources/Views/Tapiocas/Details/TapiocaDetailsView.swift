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
    
    init(tapioca : Tapioca, tapiocaDrink : Tapioca.TapiocaDrinks, tapiocaSize : [Tapioca.TapiocaDrinks.DrinkSize] ){
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
                ProductDetailsView(
                    imageName: tapiocaDrink.imagePath,
                    productName: "Tapioca de \(tapiocaDrink.name)", productPrice: nil,
                    productDescription: tapioca.tapioca_type)
                
                VStack {
                    //Method to choose your tapioca Size
                    chooseYourProductSize()
                    AddToCartButtonView(
                        productName:  "Tapioca de \(tapiocaDrink.name) - \(tapioca.tapioca_type)"
                        ,
                        
                        
                        productPrice:  selectedSize.price,
                        
                        itemsQuantity: [],
                        productSize: selectedSize.type,
                        extras : [],
                        cartManager: cartManager,
                        navigateToContentView: $navigateToContentView
                    )
               
                }
                .padding()
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 8))
                .frame(maxWidth: .infinity)
                
                
                
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
                .productTextStyleModifier()
            SegmentedSelector(
                items: tapiocaSize,
                titleProvider: { size in "\(size.type) - \(size.price)" },
                selectedItem: $selectedSize
            )
 
        }
    }
}

#Preview {
    
    let tapiocaDrink = Tapioca.TapiocaDrinks(
        id: "1",
        name: "Matcha", imagePath: "coco",
        size: [
            Tapioca.TapiocaDrinks.DrinkSize(id: "small", type: "Normal", price: "$12.00"),
            Tapioca.TapiocaDrinks.DrinkSize(id: "big", type: "Litro", price: "$24.00")
        ]
    )
    
    let tapioca = Tapioca(
        id: "1",
        tapioca_type: "Base leche",
        tapioca_drinks: [tapiocaDrink]
    )
    
    TapiocaDetailsView(
        tapioca: tapioca,
        tapiocaDrink: tapiocaDrink,
        tapiocaSize: tapiocaDrink.size
    )
    .environmentObject(CartManager())
}
