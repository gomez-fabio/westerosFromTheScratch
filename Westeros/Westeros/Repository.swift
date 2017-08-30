//
//  Repository.swift
//  Westeros
//
//  Created by Fabio Gomez on 23/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

final class Repository {
    
    static let local = LocalFactory()
    
}

protocol HouseFactory {
    
    typealias HouseFilter  = (House)  -> Bool
    typealias SeasonFilter = (Season) -> Bool
    
    var houses  : [House]  {get}
    var seasons : [Season] {get}
    
    func house(named: String)  -> House?
    func season(named: String) -> Season?
    
    func houses(filteredBy: HouseFilter)   -> [House]
    func seasons(filteredBy: SeasonFilter) -> [Season]
}

final class LocalFactory : HouseFactory {
    
    func houses(filteredBy: HouseFilter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }

    var seasons: [Season] {
        get {
            let season01 = Season(name: "Season 1",
                           releaseDate: "09/05/2011".dateToString(),
                                 image: #imageLiteral(resourceName: "S01.png"))
            
            let season02 = Season(name: "Season 2",
                           releaseDate: "01/04/2012".dateToString(),
                                 image: #imageLiteral(resourceName: "S02.png"))
            
            let season03 = Season(name: "Season 3",
                           releaseDate: "31/03/2013".dateToString(),
                                 image: #imageLiteral(resourceName: "S03.png"))
            
            let season04 = Season(name: "Season 4",
                           releaseDate: "06/04/2014".dateToString(),
                                 image:#imageLiteral(resourceName: "S04.png"))
            
            let season05 = Season(name: "Season 5",
                           releaseDate: "12/04/2015".dateToString(),
                                 image: #imageLiteral(resourceName: "S05.png"))
            
            let season06 = Season(name: "Season 6",
                           releaseDate: "24/04/2016".dateToString(),
                                 image: #imageLiteral(resourceName: "S06.png"))
            
            let e101 = Episode(title: "Winter is coming",
                             airDate: "09/05/2011".dateToString(),
                               image: #imageLiteral(resourceName: "e101.jpg"),
                            synopsis: "Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.",
                              season: season01,
                              number: 1)
            
            let e102 = Episode(title: "The kingsroad",
                             airDate: "16/05/2011".dateToString(),
                               image: #imageLiteral(resourceName: "e102.jpg"),
                            synopsis: "While Bran recovers from his fall, Ned takes only his daughters to King's Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them.",
                              season: season01,
                              number: 2)
            
            let e201 = Episode(title: "The nord remembers",
                             airDate: "01/04/2012".dateToString(),
                               image: #imageLiteral(resourceName: "e201.jpg"),
                            synopsis: "Tyrion arrives at King's Landing to take his father's place as Hand of the King. Stannis Baratheon plans to take the Iron Throne for his own. Robb tries to decide his next move in the war. The Night's Watch arrive at the house of Craster.",
                              season: season02,
                              number: 1)
            
            let e202 = Episode(title: "The nigth lands",
                             airDate: "08/04/2012".dateToString(),
                               image: #imageLiteral(resourceName: "e202.jpg"),
                            synopsis: "Arya makes friends with Gendry. Tyrion tries to take control of the Small Council. Theon arrives at his home, Pyke, in order to persuade his father into helping Robb with the war. Jon tries to investigate Craster's secret.",
                              season: season02,
                              number: 2)
            
            let e301 = Episode(title: "Valar Dohaeris",
                             airDate: "31/03/2013".dateToString(),
                               image: #imageLiteral(resourceName: "e301.jpg"),
                            synopsis: "Jon is brought before Mance Rayder, the King Beyond the Wall, while the Night's Watch survivors retreat south. In King's Landing, Tyrion asks for his reward. Littlefinger offers Sansa a way out.",
                              season: season03,
                              number: 1)
            
            let e302 = Episode(title: "Dark wings, dark words",
                             airDate: "07/04/2013".dateToString(),
                               image: #imageLiteral(resourceName: "e302.jpg"), synopsis: "Bran and company meet Jojen and Meera Reed. Arya, Gendry, and Hot Pie meet the Brotherhood. Jaime travels through the wilderness with Brienne. Sansa confesses her true feelings about Joffery to Margaery.",
                              season: season03,
                              number: 2)
            
            let e401 = Episode(title: "Two swords",
                             airDate: "06/04/2014".dateToString(),
                               image: #imageLiteral(resourceName: "e401.jpg"),
                            synopsis: "Tyrion welcomes a guest to King's Landing. At Castle Black, Jon stands trial. Daenerys is pointed to Meereen, the mother of all slave cities. Arya runs into an old enemy.",
                              season: season04,
                              number: 1)
            
            let e402 = Episode(title: "The lion and the rose",
                             airDate: "13/04/2014".dateToString(),
                               image: #imageLiteral(resourceName: "e402.jpg"),
                            synopsis: "Joffrey and Margaery's wedding has come. Tyrion breaks up with Shae. Ramsay tries to prove his worth to his father. Bran and company find a Weirwood tree.",
                              season: season04,
                              number: 2)
            
            let e501 = Episode(title: "The wars to come",
                             airDate: "12/04/2015".dateToString(),
                               image: #imageLiteral(resourceName: "e501.jpg"),
                            synopsis: "Cersei and Jaime adjust to a world without Tywin. Tyrion and Varys arrive at Pentos. In Meereen, a new enemy emerges. Jon is caught between two kings.",
                              season: season05,
                              number: 1)
            
            let e502 = Episode(title: "The house of black and white",
                             airDate: "19/04/2015".dateToString(),
                               image: #imageLiteral(resourceName: "e502.jpg"),
                            synopsis: "Arya arrives in Braavos. Jaime takes on a secret mission. Ellaria Sand seeks revenge for Oberyn's death. Stannis makes Jon a generous offer as the Night's Watch elects a new Lord Commander. Daenerys is faced with a difficult decision.",
                              season: season05,
                              number: 2)
            
            let e601 = Episode(title: "The red woman",
                             airDate: "24/04/2016".dateToString(),
                               image: #imageLiteral(resourceName: "e601.jpg"),
                            synopsis: "The fate of Jon Snow is revealed. Daenerys is brought before Khal Moro. Tyrion gets used to living in Meereen. Ramsay sends his dogs after Theon and Sansa. Ellaria and the Sand Snakes make their move. Cersei mourns for Myrcella.",
                              season: season06,
                              number: 1)
            
            let e602 = Episode(title: "Home",
                             airDate: "01/05/2016".dateToString(),
                               image: #imageLiteral(resourceName: "e602.jpg"),
                            synopsis: "Bran trains with the Three-Eyed Raven. Tommen meets with Cersei. Tyrion makes a bold move. Theon leaves while at Pyke new issues arise. Ramsay's brother is born. Davos asks Melisandre for a miracle.",
                              season: season06,
                              number: 2)
            
            season01.add(episodes: e101,e102)
            season02.add(episodes: e201,e202)
            season03.add(episodes: e301,e302)
            season04.add(episodes: e401,e402)
            season05.add(episodes: e501,e502)
            season06.add(episodes: e601,e602)
            
            return [season01, season02, season03, season04, season05, season06].sorted()

        }
    }
    
    var houses: [House] {
        get {
            
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryen.png"), description: "Three headed dragon")
            
            // La url puede fallar de ahí que la pongamos como opcional por narices
            let starkURL     = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            let stark     = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", wikiURL: starkURL)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", wikiURL: lannisterURL)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire & Blood", wikiURL: targaryenURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            let jaime  = Person(name: "Jaime", alias: "Kingslayer", house: lannister)
            
            let daenerys = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            
            // Añadimos personajes a las casas
            stark.add(persons: robb, arya)
            lannister.add(persons: tyrion, cersei, jaime)
            targaryen.add(person: daenerys)
            
            return [stark, lannister, targaryen].sorted()
            
        }
    }
    
    // Opcional de casa, por si la casa que pasamos no existe, entonces devolvemos nil
    func house(named: String) -> House? {
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
    
    func season(named: String) -> Season? {
        let season = seasons.filter{$0.name.uppercased() == named.uppercased()}.first
        return season
    }
    
    
}
