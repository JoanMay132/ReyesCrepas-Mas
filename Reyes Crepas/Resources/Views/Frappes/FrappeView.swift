//
//  FrappeView.swift
//  Reyes Crepas
//
//  Created by David Chong on 12/23/24.
//
import SwiftUI

struct FrappeView: View {
    @StateObject private var frappeViewModel = FrappeViewModel()  // Instancia de ViewModel
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
                
                // Si los frappes están vacíos, muestra un indicador de carga
                if frappeViewModel.frappes.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(frappeViewModel.frappes) { frappe in
                            NavigationLink {
                                FrappeDetailsView(frappe: frappe, extra: frappe.extras)

                            } label: {
                                VStack {
                                    // Aquí puedes agregar la imagen si la tienes en Firestore
                                    Image(frappe.image)
                                        .productImageStyle()
                                    
                                    VStack {
                                        Text(frappe.name)
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
        }
        .onAppear {
            frappeViewModel.fetchProducts() // Llama a la función para cargar los datos
        }
        .pinkCakeBackground()
    }
}

#Preview {
    FrappeView()  // Aquí no necesitas pasar los frappes manualmente, ya que se cargarán desde Firestore
}
