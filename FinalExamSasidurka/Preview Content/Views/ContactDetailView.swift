//  Sasidurka Venkatesan - 991542294
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
            Text(user.fullName)
                .font(.largeTitle)
                .bold()

            Text("Age: \(user.age) - Gender: \(user.gender)")

            Text("Phone: \(user.phone)")

            Text("Address:")
                .font(.headline)
            Text("\(user.address.address),\(user.address.city), \(user.address.postalCode), \(user.address.country)")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)

            Text("Company:")
                .font(.headline)
            Text("\(user.company.name)")
                .font(.body)
                .foregroundColor(.gray)
            Text("Department: \(user.company.department)")
                .font(.body)
                .foregroundColor(.gray)
            Text("Title: \(user.company.title)")
                .font(.body)
                .foregroundColor(.gray)

            NavigationLink("View on Map", destination: ContactMapView(user: user))
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)

            Spacer()
        }
        .padding()
        .navigationTitle("Contact Details")
    }
}



