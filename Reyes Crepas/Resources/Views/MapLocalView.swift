//
//  MapLocalView.swift
//  Reyes Crepas
//
//  Created by Joan May on 19/02/25.
//

import SwiftUI
import MapKit

struct MapLocalView: View {

    let showButton: Bool
    @State private var region = MKCoordinateRegion(
        center: Place.reyesCrepas.coordinate,
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    var body: some View {
        VStack(alignment: .leading) {
            Text(Place.reyesCrepas.name)
                .font(.headline)
                .padding(.horizontal)
            
            Map(position: .constant(.region(region))) {
                Annotation(Place.reyesCrepas.name, coordinate: Place.reyesCrepas.coordinate) {
                    Image("LogoReyes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .shadow(radius: 4)
                }
            }
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 5)
        }
        .padding()
        
        if showButton { Button("Abrir en Apple Maps") {
            let placemark = MKPlacemark(coordinate: region.center)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "Reyes Crepas y más"
            mapItem.openInMaps()
        }
            .buttonStyle(.borderedProminent)

        }
        
    }
}



#Preview {
    MapLocalView(showButton: true)
}
