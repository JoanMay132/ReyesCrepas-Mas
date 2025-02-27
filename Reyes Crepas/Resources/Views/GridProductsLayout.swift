import SwiftUI

struct GridProductsLayout: View {
    let products: [Product]  
    let frappes: [Frappe]
    let tapiocas: [Tapioca]
    let pancakes: [Pancake]
    let crepas: [Crepas]
    let barraDeCafe: [BarraDeCafe]
    let tallarines: [Tallarines]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(products) { product in
                    NavigationLink {
                        destinationProduct(for: product, frappes: frappes, tapiocas: tapiocas, pancakes: pancakes, crepas: crepas, barraDeCafe: barraDeCafe, tallarines: tallarines)
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
                        .shapeProduct()
                    }
                }
            }
            .paddingProductList()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Reyes Crepas y Más")
        .pinkCakeBackground()
    }
}

#Preview {
    let sampleProducts: [Product] = [
        Product(id: "1", product_id: 1, productType: .frappe),
        Product(id: "2", product_id: 2, productType: .tapiocas),
        Product(id: "3", product_id: 3, productType: .pancakes),
        Product(id: "4", product_id: 4, productType: .crepas),
        Product(id: "5", product_id: 5, productType: .barraDeCafe),
        Product(id: "6", product_id: 6, productType: .tallarines)
    ]
    
    GridProductsLayout(
        products: sampleProducts,
        frappes: [],
        tapiocas: [],
        pancakes: [],
        crepas: [],
        barraDeCafe: [],
        tallarines: []
    )
}
