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
                VStack {
                    VStack(alignment: .leading) {
                        Text("Frappes")
                            .productTitleStyleModifier()
                    }

                    LazyVGrid(columns: columns) {
                        ForEach(frappes) { frappe in
                            NavigationLink {
                                Text("Detalles de \(frappe.name)")
                            } label: {
                                VStack {
                                    Image(frappe.name)
                                        .productImageStyle()
                                    
                                    VStack {
                                        Text(frappe.name)
                                            .productTextStyleModifier()
                                    }
                                    .productStyleVStack()                                }
                            }
                            .shapeProduct()
                        }
                        .paddingProductList()
                        
                    }
                }
            }
//            .navigationTitle("Frappes")
            .pinkCakeBackground()
        }
    }

}

#Preview {
    // Decodifica el JSON de frappes
    let frappes: [Frappe] = Bundle.main.decode("frappes.json")
    
    // Retorna la vista FrappeView con los frappes
    return FrappeView(frappes: frappes)
}
