//
//  Season.swift
//  Westeros
//
//  Created by Fabio Gomez on 27/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

typealias Episodes = Set<Episode>

final class Season {
    
    let name        : String
    let releaseDate : Date
    private var _episodes : Episodes
    
    var episodes: Episodes {
        return _episodes
    }
    
    init(name: String, releaseDate: Date) {
        self.name        = name
        self.releaseDate = releaseDate
        _episodes = Episodes()
    }
    
}

extension Season: CustomStringConvertible {
    var description: String {
        return "\(name) \(releaseDate)"
    }
}

extension Season {
    
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        guard episode.season?.name == self.name else {
            return
        }
        _episodes.insert(episode)
    }
    
    // Función variádica, función que puede recibir n parámetros separados por comas y lo que recibe lo mete en un array que despues podemos recorrer de manera habitual
    func add(episodes: Episode...) {
        for episode in episodes {
            add(episode: episode)
        }
    }
    
    // Sorted [Person]
    func sortedEpisodes() -> [Episode] {
        return _episodes.sorted()
    }
}

extension Season {
    var proxyForEquality: String {
            return "\(name) \(releaseDate)"
    }
}

extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Season: Hashable {
    var hashValue: Int {
            return proxyForEquality.hashValue
    }
}

extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.releaseDate < rhs.releaseDate
    }
}

