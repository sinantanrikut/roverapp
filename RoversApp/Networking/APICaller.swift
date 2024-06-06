//
//  APICaller.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 5.06.2024.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getRoverList(completionHandler: @escaping (_ result: Result<RoverModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstants.shared.serverAddress
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(RoverModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
    
    static func getRoverDetail(roverName: String, completionHandler: @escaping (_ result: Result<RoverDetailModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstants.shared.imageServerAddress + roverName + "/latest_photos"
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(RoverDetailModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
//                print(err.debugDescription)
//                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}

