//
//  Pancakes.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/24/25.
//

import SwiftUI

struct PancakesView: View {
    let pancakes: [Pancake]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(pancakes) { pancake in
                        NavigationLink {
                            Text("Detalles de \(pancake.name)")
                        } label: {
                            VStack {
                                Image(pancake.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 130)
                                    .padding()
                                
                                VStack {
                                    Text(pancake.name)
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.yellowBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.clear)
                                )
                            }
                        }
                        .clipShape(.rect(cornerRadius : 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.yellowBackground)
                        )
                    }
                    .padding([.horizontal, .bottom])
                    
                }
            }
            //
            .background(.pinkCakeBackground)
        }
    }
}

#Preview {
    // Decodifica el JSON de frappes
    let pancakes: [Pancake] = Bundle.main.decode("pancakes.json")
    
    // Retorna la vista FrappeView con los frappes
    return PancakesView(pancakes: pancakes)
}


    
    
    
    
    

