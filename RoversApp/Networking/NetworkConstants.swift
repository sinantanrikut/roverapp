//
//  NetworkConstants.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 5.06.2024.
//

import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    public var serverAddress: String {
        get {
            return "https://mars-photos.herokuapp.com/api/v1/rovers"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://mars-photos.herokuapp.com/api/v1/rovers/"
        }
    }
}
