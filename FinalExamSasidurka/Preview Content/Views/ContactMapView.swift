//  Sasidurka Venkatesan - 991542294
//  ContactMapView.swift
//  FinalExamSasidurka
//
//  Created by Sasidurka on 2024-12-13.
//
import SwiftUI
import MapKit

struct ContactMapView: View {
    let user: User
    @State private var mapType: MKMapType = .standard

    var body: some View {
        VStack {
            
            MapView(
                mapType: $mapType,
                coordinate: CLLocationCoordinate2D(
                    latitude: user.address.coordinates.lat,
                    longitude: user.address.coordinates.lng
                ),
                title: user.fullName,
                subtitle: "\(user.address.city), \(user.address.postalCode), \(user.address.country)"
            )
            .frame(maxHeight: 400)

            Picker("Map Type", selection: $mapType) {
                Text("Standard").tag(MKMapType.standard)
                Text("Satellite").tag(MKMapType.satellite)
                Text("Hybrid").tag(MKMapType.hybrid)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
        .navigationTitle("Contact Location")
    }
}

struct MapView: UIViewRepresentable {
    @Binding var mapType: MKMapType
    var coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = mapType

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subtitle
        mapView.addAnnotation(annotation)

        mapView.setRegion(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ), animated: false)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = mapType
    }
}

