//
//  ContentView.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    let frappes : [String : Frappes] = Bundle.main.decode("frappes.json")
    let products : [Products] = Bundle.main.decode("products.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
       
        Text(String(products.count))
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(products) { product in
                        NavigationLink {
                            Text("Detail View")
                        } label : {
                            VStack {
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 150)
                                
                                VStack {
                                    Text(product.productType)
                                        .font(.headline)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu Reyes Crepas & Más")
        }
        
    }
}

#Preview {
    ContentView()
}
