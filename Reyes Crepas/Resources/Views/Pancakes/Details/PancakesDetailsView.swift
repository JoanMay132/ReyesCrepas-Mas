//
//  PancakesDetailsView.swift
//  Reyes Crepas
//
//  Created by David Chong on 2/25/25.
//

import SwiftUI

struct PancakesDetailsView: View {
    let pancake: Pancake
    @Environment(\.dismiss) private var dismiss
    @State private var selectedQuantity: Int = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        Image(pancake.name)
                            .resizable()
                            .frame(width: 350, height: 400)
                            .scaledToFit()
                    }
                    .shapeProduct()
                    
                    VStack {
                        Text(pancake.name)
                            .font(.title.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
        
                        Text(pancake.price)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                        Text(pancake.description)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .productStyleVStack()
                    
                    // Información sobre el pancake (sin extras)
                    VStack {
                        Text("¿Cuántos pancakes desea?")
                            .font(.headline)
                        Divider()
            
                        HStack(spacing: 10) {
                            Button(action: {
                                increaseQuantity()
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                            }
                            
                            Text("\(selectedQuantity)")
                                .font(.body)
                                .frame(width: 30)
                            
                            Button(action: {
                                decreaseQuantity()
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding()
                    
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
                                Text("Pancakes")
                            }
                        }
                    }
                }
            }
            .pinkCakeBackground()
        }
    }
    
    private func increaseQuantity() {
        if selectedQuantity < 10 { // Puedes establecer un límite si lo deseas
            selectedQuantity += 1
        }
    }
    
    private func decreaseQuantity() {
        if selectedQuantity > 0 {
            selectedQuantity -= 1
        }
    }
}

#Preview {
    let pancakes: [Pancake] = Bundle.main.decode("pancakes.json")
    if let pancake = pancakes.first(where: { $0.id == "tocineta_pancake" }) {
        return PancakesDetailsView(pancake: pancake)
    } else {
        return Text("Pancake not found")
    }
}
