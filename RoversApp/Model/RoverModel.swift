//
//  RoverModel.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 5.06.2024.
//

import Foundation

// MARK: - RoverModel
struct RoverModel: Codable {
    let rovers: [Rover]
}

// MARK: - Rover
struct Rover: Codable {
    let id: Int
    let name: String?
    let landingDate: String?
    let launchDate: String?
    let status: String?
    let maxSol: Int?
    let maxDate: String?
    let totalPhotos: Int?
    let cameras: [Camera]

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
        case maxSol = "max_sol"
        case maxDate = "max_date"
        case totalPhotos = "total_photos"
        case cameras
    }
}

// MARK: - Camera
struct Camera: Codable {
    let name: String
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}
