import SwiftUI

struct GridProductsLayout: View {
    let products: [Product]
    let frappes: [Frappe]  // Asegúrate de pasar esta variable al inicializar la vista
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(products) { product in
                    NavigationLink(value: product) {
                        VStack {
                            Image(product.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 150)
                                .padding()
                            
                            VStack {
                                Text(product.productType)
                                    .font(.headline)
                                    .foregroundStyle(.black)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.yellowBackground)
                        }
                        .clipShape(.rect(cornerRadius : 10))

                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.yellowBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    
    }
}

#Preview {
    let products: [Product] = Bundle.main.decode("products.json")
    let frappes: [Frappe] = Bundle.main.decode("frappes.json")  
    
    GridProductsLayout(products: products, frappes: frappes)
}
