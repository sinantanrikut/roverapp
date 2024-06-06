//
//  UIViewExtensions.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 6.06.2024.
//

import Foundation
import UIKit

extension UIView {
    func round( _ radious: CGFloat = 10) {
        self.layer.cornerRadius = radious
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}

extension Notification.Name {
    static let didReceiveRoverData = Notification.Name("didReceiveRoverData")
}
