import SwiftUI
// MARK: - GridProductsLayout
struct GridProductsLayout: View {
    let products: [Product]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(products) { product in
                        NavigationLink {
                            destinationProduct(for: product)
                        } label: {
                            VStack {
                                Image(product.image)
                                    .productImageStyle()
                                VStack {
                                    Text(product.productType.rawValue)
                                        .productTextStyleModifier()
                                    
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
        .navigationBarBackButtonHidden(true)
               .navigationTitle("Reyes Crepas y Más")
               .pinkCakeBackground()
    }
  
    // MARK: - Decide la vista destino según productType
    @ViewBuilder
    func destinationProduct(for product: Product) -> some View {
        switch product.productType {
        case .frappe:
            FrappeView()
        case .tapiocas:
            TapiocaView()
        case .pancakes:
            PancakesView()
        case .crepas:
            CrepasView()
        case .barraDeCafe:
            BarraDeCafeView()
        case .tallarines:
            TallarinesView()
        }
    }
}

