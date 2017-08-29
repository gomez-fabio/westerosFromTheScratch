//
//  UtilsDate.swift
//  Westeros
//
//  Created by Fabio Gomez on 29/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

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
