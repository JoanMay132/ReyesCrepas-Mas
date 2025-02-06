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
    @Environment(\.dismiss) private var dismiss
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
        NavigationStack {
            ScrollView {
                VStack {
                    // Tapioca drink image
                    VStack {
                        Image(tapiocaDrink.name)
                            .resizable()
                            .frame(width: 350, height: 400)
                            .scaledToFit()
                    }
                    .shapeProduct()

                    // Tapioca details
                    VStack {
                        Text("Tapioca de " + tapiocaDrink.name)
                            .font(.title.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text(tapioca.tapioca_type)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .productStyleVStack()

                    // Available size
                    Section("Tamaño de tu tapioca") {
                        Picker("Tamaño de tu tapioca", selection: $selectedSize) {
                            ForEach(tapiocaSize, id: \.self) { size in
                                Text("\(size.type) \(size.price)")
                                    .padding(.bottom, 3)
                            }
                        }
                        .pickerStyle(.segmented)
                       
                    }
                    .padding()

                    // Add to cart button
                    NavigationLink(destination: ContentView()) {
                        Text("Agregar al carrito")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.top, 20)
                    .padding()
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                Text("Tapiocas")
                            }
                        }
                    }
                }
            }
            .pinkCakeBackground()
        }
    }
}

#Preview {
    let tapiocas: [Tapioca] = Bundle.main.decode("tapiocas.json")
    if let tapioca = tapiocas.first(where: { $0.tapioca_type == "Base leche" }),
       let drink = tapioca.tapioca_drinks.first(where: { $0.id == "coconut" }) {
        return TapiocaDetailsView(tapioca: tapioca, tapiocaDrink: drink, tapiocaSize: drink.size)
    } else {
        return Text("Product Not Found")
    }
}
