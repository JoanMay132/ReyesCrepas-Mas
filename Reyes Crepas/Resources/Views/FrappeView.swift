//
//  FrappeView.swift
//  Reyes Crepas
//
//  Created by David Chong on 12/23/24.
//
import SwiftUI

struct FrappeView: View {
    let frappes: [Frappe]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(frappes) { frappe in
                        NavigationLink {
                            Text("Detalles de \(frappe.name)")
                        } label: {
                            VStack {
                                 Image(frappe.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 130)
                                    .padding()
                                
                                VStack {
                                    Text(frappe.name)
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
            .navigationTitle("Frappes")
            .background(.pinkCakeBackground)
        }
    }

}

#Preview {
    // Decodifica el JSON de frappes
    let frappes: [Frappe] = Bundle.main.decode("frappes.json")
    
    // Retorna la vista FrappeView con los frappes
    return FrappeView(frappes: frappes)
}
