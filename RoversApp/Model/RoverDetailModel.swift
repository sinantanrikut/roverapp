//
//  RoverDetailModel.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 6.06.2024.
//

import Foundation

// MARK: - RoverDetailModel
struct RoverDetailModel: Codable {
    let latestPhotos: [LatestPhoto]
    enum CodingKeys: String, CodingKey {
        case latestPhotos = "latest_photos"
    }
}

// MARK: - LatestPhoto
struct LatestPhoto: Codable {
    let id, sol: Int
    let camera: LatestPhotoCamera
    let imgSrc: String
    let earthDate: String
    let rover: Rover

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

// MARK: - LatestPhotoCamera
struct LatestPhotoCamera: Codable {
    let id: Int
    let name: String
    let roverID: Int
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}


// MARK: - CameraElement
struct CameraElement: Codable {
    let name: String
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}

enum RoverName: String, Codable {
    case curiosity = "Curiosity"
}

enum Status: String, Codable {
    case active = "active"
}
