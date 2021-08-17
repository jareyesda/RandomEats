// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let businesses = try? newJSONDecoder().decode(Businesses.self, from: jsonData)

import Foundation

// MARK: - Businesses
struct Businesses: Codable {
    let businesses: [Business]
    let total: Int
    let region: Region
}

// MARK: - Business
struct Business: Codable, Identifiable {
    let id, alias, name: String
    let imageURL: String
    let isClosed: Bool
    let url: String
    let reviewCount: Int
    let categories: [Category]
    let rating: Double
    let coordinates: Center
    let transactions: [Transaction]
    let price: Price
    let location: Location
    let phone, displayPhone: String
    let distance: Double

    enum CodingKeys: String, CodingKey {
        case id, alias, name
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case url
        case reviewCount = "review_count"
        case categories, rating, coordinates, transactions, price, location, phone
        case displayPhone = "display_phone"
        case distance
    }
}

// MARK: - Category
struct Category: Codable {
    let alias, title: String
}

// MARK: - Center
struct Center: Codable {
    let latitude, longitude: Double
}

// MARK: - Location
struct Location: Codable {
    let address1: String
    let address2: Address2?
    let address3: String?
    let city: City
    let zipCode: String
    let country: Country
    let state: State
    let displayAddress: [String]

    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city
        case zipCode = "zip_code"
        case country, state
        case displayAddress = "display_address"
    }
}

enum Address2: String, Codable {
    case empty = ""
    case ste101 = "Ste 101"
    case steF = "Ste F"
}

enum City: String, Codable {
    case lutz = "Lutz"
    case tampa = "Tampa"
}

enum Country: String, Codable {
    case us = "US"
}

enum State: String, Codable {
    case fl = "FL"
}

enum Price: String, Codable {
    case empty = "$"
    case price = "$$"
    case purple = "$$$"
}

enum Transaction: String, Codable {
    case delivery = "delivery"
    case pickup = "pickup"
}

// MARK: - Region
struct Region: Codable {
    let center: Center
}
