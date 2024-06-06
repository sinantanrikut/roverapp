//
//  MainViewModel.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 5.06.2024.
//

import Foundation

class MainViewModel {
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var cellDataSource : Observable<[RoverTableCellViewModel]> = Observable(nil)
    var dataSource: RoverModel?
    var dataDetailSource: RoverDetailModel?
   // var movies: Observable<[MovieTableCellViewModel]> = Observable(nil)
    
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.rovers.count ?? 0
    }
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        APICaller.getRoverList { [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let roverData):
                self?.dataSource = roverData
                self?.mapCellData()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func roverGetData(_ roverName: String) {
        
        APICaller.getRoverDetail(roverName: roverName, completionHandler: { [weak self] result in
                switch result {
                case .success(let roverDetailData):
                    self?.dataDetailSource = roverDetailData
                    NotificationCenter.default.post(name: .didReceiveRoverData, object: nil)

                case .failure(let err):
                    print(err)
                }
        })
        
    }
  
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.rovers.compactMap({RoverTableCellViewModel(rover: $0)})
    }
    func retriveRover(withId id: Int) -> Rover? {
        guard let rover = dataSource?.rovers.first(where: {$0.id == id}) else {
            return nil
        }
        
        return rover
    } 
    
    func roverDetail(_ id: Int) ->LatestPhoto? {
        
        guard let roverDetail = dataDetailSource?.latestPhotos.first(where: {$0.id == id}) else {
            return nil
        }
        
        return roverDetail
    }
}


