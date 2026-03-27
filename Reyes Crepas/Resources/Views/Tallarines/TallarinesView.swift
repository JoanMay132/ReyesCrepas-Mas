//
//  TallarinesView.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/01/25.
//
import SwiftUI

struct TallarinesView: View {
    @StateObject private var viewModel = MenuViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Tallarines")
                            .productTitleStyleModifier()
                    }
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(viewModel.items) { item in
                                NavigationLink {
                      
                                        TallarinesDetailsView(tallarines: item)
                                    
                                } label: {
                                    VStack {
                                        
                                        if let imageName = item.imagePath {
                                            if UIImage(named: imageName) != nil {
                                                Image(imageName)
                                                    .productImageStyle()
                                            } else {
                                                Image("default")
                                                    .productImageDefaultStyle(imageName)
                                            }
                                        } else {
                                            ProgressView()
                                                .frame(height: 150)
                                        }
                                        VStack {
                                            Text(item.name ?? "default")
                                                .productTextStyleModifier()

                                        }
                                        .productStyleVStack()
                                    }
                                    .paddingProductList()

                                }
                                .shapeProduct()
                            
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchProducts(from: "tallarines")
            }
            .pinkCakeBackground()
        
    }
}

#Preview {
    TallarinesView()
}
