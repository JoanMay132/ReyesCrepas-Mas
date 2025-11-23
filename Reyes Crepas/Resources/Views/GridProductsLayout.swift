import SwiftUI
// MARK: - GridProductsLayout
struct GridProductsLayout: View {
    let products: [Product]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(products) { product in
                    NavigationLink {
                        destinationProduct(for: product)
                    } label: {
                        VStack {
                            Image(product.image)
                                .productImageStyle()
                            
                            Text(product.productType.rawValue)
                                .productTextStyleModifier()
                        }
                        .productStyleVStack()
                    }
                    .shapeProduct()
                }
            }
            .paddingProductList()
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
            FrappeView()               // Cada subview se encarga de su fetch
                .environmentObject(CartManager())
        case .tapiocas:
            TapiocaView()
                .environmentObject(CartManager())
        case .pancakes:
            PancakesView()
                .environmentObject(CartManager())
        case .crepas:
            CrepasView()     // si usas JSON, pásalos aquí
                .environmentObject(CartManager())
        case .barraDeCafe:
            BarraDeCafeView()
                .environmentObject(CartManager())
        case .tallarines:
            TallarinesView()
                .environmentObject(CartManager())
        }
    }
}

