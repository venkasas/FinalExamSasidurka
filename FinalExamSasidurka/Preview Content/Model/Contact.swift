//  Saidurka Venkatesan - 991542294
//  Contact.swift
//  FinalExamSasidurka
//
//  Created by Sasidurka on 2024-12-13.
//


import Foundation

// Top-level response
struct UsersResponse: Codable {
    let users: [User]
}

// User model
struct User: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let phone: String
    let address: Address
    let company: Company

    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

// Address model
struct Address: Codable {
    let city: String
    let postalCode: String
    let country: String
    let coordinates: Coordinates
}

// Coordinates model
struct Coordinates: Codable {
    let lat: Double
    let lng: Double
}

// Company model
struct Company: Codable {
    let name: String
    let department: String
    let title: String
}



