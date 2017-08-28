//
//  UIKitExtension.swift
//  Westeros
//
//  Created by Fabio Gomez on 23/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: self)
        
        return nav
    }
}

extension String {
    
    func dateToString() -> Date {
        
        let dateToString = self
        let dateToStringFormatter = DateFormatter()
        
        dateToStringFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateToStringFormatter.date(from: dateToString)!
    }
}

extension Date {
    
    func stringToDate() -> String {
        
        let stringToDate = self
        let stringToDateFormatter = DateFormatter()
        
        stringToDateFormatter.dateStyle  = .short
        stringToDateFormatter.timeStyle  = .none
        stringToDateFormatter.dateFormat = "dd/MM/yyyy"
        
        return stringToDateFormatter.string(from: stringToDate)
    }
}
