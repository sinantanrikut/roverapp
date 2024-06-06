//
//  DetailRoverViewModel.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 6.06.2024.
//

import Foundation

class DetailsRoverViewModel {
    
    var roverData: Rover
    var roverImage: URL?
    var numberPhotoLabel: String
    var numberCameraLabel: String
    var roverName: String

    init(rover: Rover) {
        self.roverData = rover        
        self.roverName = rover.name ?? ""
        self.numberPhotoLabel = "Number of Photos: \(rover.totalPhotos ?? 0)"
        self.numberCameraLabel = "Number of Cameras: \(rover.cameras.count)"
    }
}
