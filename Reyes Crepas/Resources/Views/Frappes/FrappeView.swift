//
//  FrappeView.swift
//  Reyes Crepas
//
//  Created by David Chong on 12/23/24.
//
import SwiftUI

struct FrappeView: View {
    @StateObject private var viewModel = MenuViewModel()  // Instancia de ViewModel
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Frappes")
                        .productTitleStyleModifier()
                }
                
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.items) { item in
                        NavigationLink {
                            FrappeDetailsView(frappe: item, extra: item.extras ?? [])
                        } label: {
                            VStack {
                                Image(item.name ?? "default")
                                    .productImageStyle()
                                
                                VStack {
                                    Text(item.name ?? "default")
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                }
                                .productStyleVStack()
                            }
                        }
                        .shapeProduct()
                    }
                    .paddingProductList()
                    
                }
 
            }
        }
        .onAppear {
            viewModel.fetchProducts(from: "frappes") // Llama a la función para cargar los datos
        }
        .pinkCakeBackground()
    }
}

#Preview {
    FrappeView()  // Aquí no necesitas pasar los frappes manualmente, ya que se cargarán desde Firestore
}
