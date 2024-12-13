//
//  UserViewModel.swift
//  FinalExamSasidurka
//
//  Created by Sasidurka on 2024-12-13.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    private let apiURL = "https://dummyjson.com/users"

    func fetchUsers() {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: apiURL) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: UsersResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] response in
                self?.users = response.users
            })
            .store(in: &cancellables)
    }
}

