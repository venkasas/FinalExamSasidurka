//  Sasidurka Venkatesan - 991542294
//  ContactListView.swift
//  FinalExamSasidurka
//
//  Created by Sasidurka on 2024-12-13.
//

import SwiftUI

struct ContactListView: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .navigationTitle("Contacts")
            } else if let errorMessage = viewModel.errorMessage {
                VStack {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                        viewModel.fetchUsers()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .navigationTitle("Contacts")
            } else {
                List(viewModel.users) { user in
                    NavigationLink(destination: ContactDetailView(user: user)) {
                        VStack(alignment: .leading) {
                            Text(user.fullName).font(.headline)
                            Text(user.phone).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
                .navigationTitle("Contacts")
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}
#Preview {
    ContactListView()
}
