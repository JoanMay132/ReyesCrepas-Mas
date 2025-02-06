//
//  TallarinesDetailsView.swift
//  Reyes Crepas
//
//  Created by Joan May on 05/02/25.
//

import SwiftUI

struct TallarinesDetailsView: View {
    var tallarines: Tallarines
    
    @Environment(\.dismiss) private var dismiss
    @State private var selectedExtras: [Tallarines: Int] = [:]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Drink image
                    VStack {
                        Image(tallarines.name)
                            .resizable()
                            .frame(width: 350, height: 400)
                            .scaledToFit()
                    }
                    .shapeProduct()

                    // Product information
                    VStack {
                        Text(tallarines.name)
                            .font(.title.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text(tallarines.price)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                        Text(tallarines.description)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .productStyleVStack()
                    
                    //Extras buttons
                    VStack(alignment: .leading) {
                        HStack(spacing: 10) {
                            Text("¿Cuántos tallarines deseas?")
                            Button(action: {
                                increaseQuantity(for: tallarines)
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                            }

                            Text("\(selectedExtras[tallarines] ?? 0)")
                                .font(.body)
                                .frame(width: 30)

                            Button(action: {
                                decreaseQuantity(for: tallarines)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                    }
                

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
                                Text("Tallarines")
                            }
                        }
                    }
                }
            }
            .pinkCakeBackground()
        }
    }

    private func increaseQuantity(for tallarines: Tallarines) {
        let currentQuantity = selectedExtras[tallarines, default: 0]
        if currentQuantity < 20 {
            selectedExtras[tallarines] = currentQuantity + 1
        }
    }

    private func decreaseQuantity(for tallarines: Tallarines) {
        if let currentQuantity = selectedExtras[tallarines], currentQuantity > 0 {
            selectedExtras[tallarines] = currentQuantity - 1
        }
    }
}

#Preview {
    let tallarines: [Tallarines] = Bundle.main.decode("tallarines.json")
    if let tallarin = tallarines.first(where: { $0.id == "kinder_fresa" }) {
        return TallarinesDetailsView(tallarines: tallarin)
    } else {
        return Text("Product Not Found")
    }
}
