//
//  RickMortyDto.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 27.12.2023.
//

import Foundation

struct RickMortyDto: Codable {
    var info: Info?
    var results: [Result]?
    
    // MARK: - Info
    
    struct Info: Codable {
        var count, pages: Int?
        var next: String?
        var prev: String?
    }

    // MARK: - Result
    
    struct Result: Codable, Hashable, Identifiable {
        var id: Int
        var name: String?
        var status: Status?
        var species: Species?
        var type: String?
        var gender: Gender?
        var origin, location: Location?
        var image: String?
        var episode: [String]?
        var url: String?
        var created: String?
    }

    enum Gender: String, Hashable, Codable {
        case female = "Female"
        case male = "Male"
        case unknown
    }

    // MARK: - Location
    
    struct Location: Hashable, Codable {
        var name: String?
        var url: String?
    }

    enum Species: String, Hashable, Codable {
        case alien = "Alien"
        case human = "Human"
    }

    enum Status: String, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown
    }
}
