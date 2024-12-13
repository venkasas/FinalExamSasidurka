//  Saidurka Venkatesan - 991542294
//  ContactDetailView.swift
//  FinalExamSasidurka
//
//  Created by Sasidurka on 2024-12-13.
//

import SwiftUI

struct ContactDetailView: View {
    let user: User

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(user.fullName).font(.largeTitle).bold()
            Text("Age: \(user.age) - Gender: \(user.gender)")
            Text("Phone: \(user.phone)")
            Text("Address: \(user.address.city), \(user.address.postalCode), \(user.address.country)")
            Text("Company: \(user.company.name) - \(user.company.department) (\(user.company.title))")
                .multilineTextAlignment(.leading)

            NavigationLink("View on Map", destination: ContactMapView(user: user))
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding()
        .navigationTitle("Contact Details")
    }
}

