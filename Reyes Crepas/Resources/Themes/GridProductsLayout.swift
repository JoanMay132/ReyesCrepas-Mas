import SwiftUI

struct GridProductsLayout: View {
    let products: [Product]
    let frappes: [Frappe]  // Asegúrate de pasar esta variable al inicializar la vista
    let tapiocas : [Tapioca]
    let pancakes : [Pancake]
    let crepas : [Crepas]
    let tallarines : [Tallarines]
    let barraDeCafe : [BarraDeCafe]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(products) { product in
                    NavigationLink {
                        
                        destinationProduct(for: product, frappes: frappes, tapiocas: tapiocas, pancakes : pancakes, crepas: crepas, barraDeCafe: barraDeCafe, tallarines : tallarines)
                        
                    } label : {
                        VStack {
                            Image(product.image)
                                .productImageStyle()
                            
                            VStack {
                                Text(product.productType)
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
        .navigationTitle("Reyes Crepas y Más")
        .pinkCakeBackground()
        
    }
}

#Preview {
    let products: [Product] = Bundle.main.decode("products.json")
    let frappes: [Frappe] = Bundle.main.decode("frappes.json")
    let tapiocas: [Tapioca] = Bundle.main.decode("tapiocas.json")
    let pancakes: [Pancake] = Bundle.main.decode("pancakes.json")
    let crepas: [Crepas] = Bundle.main.decode("crepas.json")
    let tallarines: [Tallarines] = Bundle.main.decode("tallarines.json")
    let barraDeCafe: [BarraDeCafe] = Bundle.main.decode("barra.json")
    
    GridProductsLayout(
        products: products,
        frappes: frappes,
        tapiocas: tapiocas,
        pancakes: pancakes,
        crepas: crepas,
        tallarines: tallarines,
        barraDeCafe: barraDeCafe
    )
}
