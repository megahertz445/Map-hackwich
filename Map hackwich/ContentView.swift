//
//  ContentView.swift
//  Map hackwich
//
//  Created by Ela Murat on 27/07/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.0558,
            longitude: -87.6743),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05)
    )
    @StateObject var locationManager = LocationManager()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var places = [Place(name: "Northwestern University", coordinate: CLLocationCoordinate2D( latitude: 42.0558, longitude: -87.6743))]
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            interactionModes: .all,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode,
            annotationItems: places) { place in
                MapAnnotation(coordinate: place.coordinate, anchorPoint: CGPoint(x: 0.5, y: 1.5)) {
                    Marker(name: place.name)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct Marker: View {
    var name: String
    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: 15)
                Rectangle()
                    .fill(.black)
                    .frame(width: 30, height: 30, alignment: .center)
                    .rotationEffect(.degrees(45))
            }
            Capsule()
                .fill(.red)
                .frame(width: 200, height: 30, alignment: .center)
            Text(name)
        }
    }
}
