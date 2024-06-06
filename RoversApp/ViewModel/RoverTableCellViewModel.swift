//
//  RoverTableCellModel.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 6.06.2024.
//

import Foundation

class RoverTableCellViewModel {
    var id: Int
    var name: String?
    var landingDate: String?
    var launchDate: String?
    var status: String?
    var image: URL?
    var dataSource: RoverDetailModel?

    
    init(rover: Rover) {
        self.id = rover.id
        self.name = rover.name ?? ""
        self.landingDate = rover.landingDate ?? ""
        self.launchDate = rover.launchDate ?? ""
        self.status = rover.status ?? ""
        self.image = URL(string: "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/04102/opgs/edr/fcam/FLB_761645828EDR_F1060660FHAZ00302M_.JPG")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        
        APICaller.getRoverDetail(roverName: imageCode, completionHandler: { [weak self] result in
                switch result {
                case .success(let roverDetailData):
                    self?.dataSource = roverDetailData
                case .failure(let err):
                    print(err)
                }
        })
        
        return URL(string: "\(dataSource?.latestPhotos.first?.imgSrc ?? "")")
    }
}
