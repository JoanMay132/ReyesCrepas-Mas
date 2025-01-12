//
//  FrappeView.swift
//  Reyes Crepas
//
//  Created by David Chong on 12/23/24.
//

import SwiftUI

struct FrappeView: View {
    let frappes: [Frappes]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns : columns){
                    ForEach(frappes) {frappes in
                        NavigationLink {
                            Text("Next view")
                        } label : {
                            VStack {
                                Image(frappes.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 150)
                                
                                VStack {
                                    Text(frappes.name)
                                        .font(.headline)
                                }
                            }
                        }
                    }
                }
            }
            
            .navigationTitle("Frappes")
        }
    }
}
    #Preview {
        // Decodifica el JSON de frappes
        let frappes: [Frappes] = Bundle.main.decode("frappes.json")
        
        // Retorna la vista FrappeDetailView con el primer frappe
        return FrappeView(frappes: frappes)
        
    
}
