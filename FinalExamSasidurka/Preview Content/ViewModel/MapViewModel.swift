//
//  MapViewModel.swift
//  FinalExamSasidurka
//
//  Created by Sasidurka on 2024-12-13.
//

import MapKit
import Foundation

class MapViewModel: ObservableObject {
    @Published var mapType: MKMapType = .standard
    @Published var region: MKCoordinateRegion
    @Published var annotations: [MKPointAnnotation] = []

    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        
        self.region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )

        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subtitle

        
        self.annotations = [annotation]
    }
}


