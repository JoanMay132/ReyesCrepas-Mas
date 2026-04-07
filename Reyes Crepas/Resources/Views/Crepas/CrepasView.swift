//
//  CrepasView.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/25/25.
//


import SwiftUI

struct CrepasView: View {
    @StateObject private var viewModel = MenuViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                // Especialidades
                crepasEspecialidadesSection()
                
                // Personaliza la crepa
                personalizarCrepasSection()
                
            }
            .padding(.bottom, 40)
        }
        .pinkCakeBackground()

        .onAppear {
            viewModel.fetchProducts(from: "crepas")
        }
    }
}

private extension CrepasView {
    
    // MARK: - Especialidades
    func crepasEspecialidadesSection() -> some View {
        VStack(alignment: .leading) {
            Text("Especialidades")
                .productTitleStyleModifier()
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.items) { item in
                        ForEach(item.especialidades ?? []) { especialidad in
               

                            CrepaCard(
                                crepa: item,
                                especialidad: especialidad,
                              
                            )
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    // MARK: - Crepa card especialidad
    struct CrepaCard: View {
        let crepa: MenuItem
        let especialidad: MenuItem.Especialidad

        var body: some View {
            NavigationLink {
                
                CrepaDetailsView(crepa: crepa,especialidad: especialidad)
            } label: {
                VStack {
                    if let imageName = especialidad.imagePath {
                        if UIImage(named: imageName) != nil {
                            Image(imageName)
                                .productImageStyle()
                           
                        } else {
                            Image("default")
                                .productImageDefaultStyle(imageName)
                        }
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text(especialidad.name)
                            .productTextStyleModifier()

                    }
                    .productStyleVStack()
                }
                .paddingProductList()
            }
            .shapeProduct()

        }
    }

    
    // MARK: - Personalizar Crepas
    func personalizarCrepasSection() -> some View {

        return VStack(alignment: .leading) {

            Text("Personaliza tu crepa")
                .productTitleStyleModifier()
                .padding(.horizontal)
            
            if let firstCrepa = viewModel.items.first {
                NavigationLink {
                    CrepaPersonalizableView(crepa: firstCrepa)
                } label: {
                    VStack {
                        Image(firstCrepa.personalización?.imagePath ?? "arma_crepa")
                            .productImageStyle()
                        
                        VStack {
                            Text("Arma tu crepa")
                                .productTextStyleModifier()

                        }
                        .productStyleVStack()
                    }
                    .paddingProductList()
                }
                .shapeProduct()
            } else {
                Text("Cargando crepas...")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
}





#Preview {
    CrepasView()
}
