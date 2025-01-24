//
//  CrepasView.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/25/25.
//

import SwiftUI


struct CrepasView: View {
    let crepas: [Crepas]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(crepas) { crepa in
                        NavigationLink {
                            Text("Detalles de \(crepa.name)")
                        } label: {
                            VStack {
                                Image(crepa.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 130)
                                    .padding()
                                
                                VStack {
                                    Text(crepa.name)
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
    let crepas: [Crepas] = Bundle.main.decode("crepas.json")
    
    // Retorna la vista FrappeView con los frappes
    return CrepasView(crepas: crepas)
}


    
    
    
    
    

