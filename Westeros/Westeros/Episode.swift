//
//  Episode.swift
//  Westeros
//
//  Created by Fabio Gomez on 27/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

final class Episode {
    
    let title       : String
    let airDate     : Date
    let image       : UIImage
    let synopsis    : String
    weak var season : Season? // para evitar referencia circular
    
    init(title: String, airDate: Date, image: UIImage, synopsis: String, season: Season) {
        self.title    = title
        self.airDate  = airDate
        self.image    = image
        self.synopsis = synopsis
        self.season   = season
        
    }
    
}

extension Episode: CustomStringConvertible {
    
    var description: String {
        return "\(title) \(airDate)"
    }
}

extension Episode {
    var proxyForEquality: String {
            return "\(title) \(airDate)"
    }
}

extension Episode: Equatable {
    
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode: Hashable {
    var hashValue: Int {
            return proxyForEquality.hashValue
    }
}

extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.airDate < rhs.airDate
    }
}
