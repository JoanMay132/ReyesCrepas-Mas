//
//  BarraDeCafe.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/27/25.
//

import SwiftUI


struct BarraDeCafeView: View {
    let barraDeCafe: [BarraDeCafe]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(barraDeCafe) { barra in
                        NavigationLink {
                            Text("Detalles de \(barra.name)")
                        } label: {
                            VStack {
                                Image(barra.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 130)
                                    .padding()
                                
                                VStack {
                                    Text(barra.name)
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
    let barraDeCafe: [BarraDeCafe] = Bundle.main.decode("barra.json")
    
    // Retorna la vista FrappeView con los frappes
    return BarraDeCafeView(barraDeCafe: barraDeCafe)
}

