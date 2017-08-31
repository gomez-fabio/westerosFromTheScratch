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
                           releaseDate: "17/04/2011".dateToString(),
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
                             airDate: "17/04/2011".dateToString(),
                               image: #imageLiteral(resourceName: "e101.jpg"),
                            synopsis: "Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.",
                              season: season01,
                              number: 1)
            
            let e102 = Episode(title: "The kingsroad",
                             airDate: "24/04/2011".dateToString(),
                               image: #imageLiteral(resourceName: "e102.jpg"),
                            synopsis: "While Bran recovers from his fall, Ned takes only his daughters to King's Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them.",
                              season: season01,
                              number: 2)
            
            let e201 = Episode(title: "The north remembers",
                             airDate: "01/04/2012".dateToString(),
                               image: #imageLiteral(resourceName: "e201.jpg"),
                            synopsis: "As Robb Stark and his northern army continue the war against the Lannisters, Tyrion arrives in King’s Landing to counsel Joffrey and temper the young king’s excesses.  On the island of Dragonstone, Stannis Baratheon plots an invasion to claim his late brother’s throne, allying himself with the fiery Melisandre, a strange priestess of a stranger god.  Across the sea, Daenerys, her three young dragons, and the khalasar trek through the Red Waste in search of allies, or water.  In the North, Bran presides over a threadbare Winterfell, while beyond the Wall, Jon Snow and the Night’s Watch must shelter with a devious wildling.",
                              season: season02,
                              number: 1)
            
            let e202 = Episode(title: "The nigth lands",
                             airDate: "08/04/2012".dateToString(),
                               image: #imageLiteral(resourceName: "e202.jpg"),
                            synopsis: "In the wake of a bloody purge in the capital, Tyrion chastens Cersei for alienating the king’s subjects.  On the road north, Arya shares a secret with Gendry, a Night’s Watch recruit.  With supplies dwindling, one of Dany’s scouts returns with news of their position.  After nine years as a Stark ward, Theon Greyjoy reunites with his father Balon, who wants to restore the ancient Kingdom of the Iron Islands.  Davos enlists Salladhor Saan, a pirate, to join forces with Stannis and Melisandre for a naval invasion of King’s Landing.",
                              season: season02,
                              number: 2)
            
            let e301 = Episode(title: "Valar Dohaeris",
                             airDate: "31/03/2013".dateToString(),
                               image: #imageLiteral(resourceName: "e301.jpg"),
                            synopsis: "Jon meets the King-Beyond-the-Wall while his Night Watch Brothers flee south. In King's Landing, Tyrion wants a reward, Margaery shows her charitable nature, Cersei arranges a dinner party, and Littlefinger offers to help Sansa. Across the Narrow Sea, Daenerys starts her journey west.",
                              season: season03,
                              number: 1)
            
            let e302 = Episode(title: "Dark wings, dark words",
                             airDate: "07/04/2013".dateToString(),
                               image: #imageLiteral(resourceName: "e302.jpg"), synopsis: "Sansa says too much. Shae asks Tyrion for a favor. Jaime finds a way to pass the time, while Arya encounters the Brotherhood Without Banners.",
                              season: season03,
                              number: 2)
            
            let e401 = Episode(title: "Two swords",
                             airDate: "06/04/2014".dateToString(),
                               image: #imageLiteral(resourceName: "e401.jpg"),
                            synopsis: "Tyrion welcomes a guest to King’s Landing. At Castle Black, Jon Snow finds himself unwelcome. Dany is pointed to Meereen, the mother of all slave cities. Arya runs into an old friend.",
                              season: season04,
                              number: 1)
            
            let e402 = Episode(title: "The lion and the rose",
                             airDate: "13/04/2014".dateToString(),
                               image: #imageLiteral(resourceName: "e402.jpg"),
                            synopsis: "Tyrion lends Jaime a hand. Joffrey and Margaery host a breakfast. At Dragonstone, Stannis loses patience with Davos. Ramsay finds a purpose for his pet. North of the Wall, Bran sees where they must go.",
                              season: season04,
                              number: 2)
            
            let e501 = Episode(title: "The wars to come",
                             airDate: "12/04/2015".dateToString(),
                               image: #imageLiteral(resourceName: "e501.jpg"),
                            synopsis: "Cersei and Jaime adjust to a world without Tywin. Varys reveals a conspiracy to Tyrion. Dany faces a new threat to her rule. Jon is caught between two kings.",
                              season: season05,
                              number: 1)
            
            let e502 = Episode(title: "The house of black and white",
                             airDate: "19/04/2015".dateToString(),
                               image: #imageLiteral(resourceName: "e502.jpg"),
                            synopsis: "Arya arrives in Braavos. Podrick and Brienne run into trouble on the road. Cersei fears for her daughter's safety in Dorne as Ellaria Sand seeks revenge for Oberyn's death. Stannis tempts Jon. An adviser tempts Daenerys.",
                              season: season05,
                              number: 2)
            
            let e601 = Episode(title: "The red woman",
                             airDate: "24/04/2016".dateToString(),
                               image: #imageLiteral(resourceName: "e601.jpg"),
                            synopsis: "The fate of Jon Snow is revealed. Daenerys meets a strong man. Cersei sees her daughter once again.",
                              season: season06,
                              number: 1)
            
            let e602 = Episode(title: "Home",
                             airDate: "01/05/2016".dateToString(),
                               image: #imageLiteral(resourceName: "e602.jpg"),
                            synopsis: "Bran trains with the Three-Eyed Raven. In King’s Landing, Jaime advises Tommen. Tyrion demands good news, but has to make his own. At Castle Black, the Night’s Watch stands behind Thorne. Ramsay Bolton proposes a plan, and Balon Greyjoy entertains other proposals.",
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
            
            let starkSigil     = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryen.png"), description: "Three headed dragon")
            let greyjoySigil   = Sigil(image: #imageLiteral(resourceName: "greyjoySigil.png"), description: "Sable a kraken or")
            let tyrrelSigil    = Sigil(image: #imageLiteral(resourceName: "tyrellSigil.png"), description: "A golden rose, on a green field")
            let baratheonSigil = Sigil(image: #imageLiteral(resourceName: "baratheonSigil.png"), description: "A black crowned stag, on a gold field")
            let arrynSigil     = Sigil(image: #imageLiteral(resourceName: "arrynSigil.png"), description: "A sky-blue falcon soaring against a white moon, on a sky-blue field")
            let martellSigil   = Sigil(image: #imageLiteral(resourceName: "martellSigil.png"), description: "A gold spear piercing a red sun on an orange field")
            let tullySigil     = Sigil(image: #imageLiteral(resourceName: "tullySigil.png"), description: "A leaping silver trout on a field of blue")
            
            // La url puede fallar de ahí que la pongamos como opcional por narices
            let starkURL     = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let greyjoyURL   = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let tyrrelURL    = URL(string: "https://awoiaf.westeros.org/index.php/House_Tyrell")!
            let baratheonURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Baratheon")!
            let arrynURL     = URL(string: "https://awoiaf.westeros.org/index.php/House_Arryn")!
            let martellURL   = URL(string: "https://awoiaf.westeros.org/index.php/House_Martell")!
            let tullyURL     = URL(string: "https://awoiaf.westeros.org/index.php/House_Tully")!

            let stark     = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", wikiURL: starkURL)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", wikiURL: lannisterURL)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire & Blood", wikiURL: targaryenURL)
            let greyjoy   = House(name: "Greyjoy", sigil: greyjoySigil, words: "We do not Sow", wikiURL: greyjoyURL)
            let tyrrel    = House(name: "Tyrrel", sigil: tyrrelSigil, words: "Growing strong", wikiURL: tyrrelURL)
            let baratheon = House(name: "Baratheon", sigil: baratheonSigil, words: "Ours is the Fury", wikiURL: baratheonURL)
            let arryn     = House(name: "Arryn", sigil: arrynSigil, words: "As High as Honor", wikiURL: arrynURL)
            let martell   = House(name: "Martell", sigil: martellSigil, words: "Unbowed, Unbent, Unbroken", wikiURL: martellURL)
            let tully     = House(name: "Tully", sigil: tullySigil, words: "Family, Duty, Honor", wikiURL: tullyURL)
            
            let robb     = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya     = Person(name: "Arya", house: stark)
            let tyrion   = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei   = Person(name: "Cersei", house: lannister)
            let jaime    = Person(name: "Jaime", alias: "Kingslayer", house: lannister)
            let daenerys = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            let theon    = Person(name: "Theon", alias: "Prince of fools", house: greyjoy)
            let margaery = Person(name: "Margaery", alias: "Little Rose", house: tyrrel)
            let joffrey  = Person(name: "Joffrey", alias: "Joffrey the Illborn", house: baratheon)
            let lysa     = Person(name: "Lysa", alias: "Lysa Tully", house: arryn)
            let oberyn   = Person(name: "Oberyn", alias: "The red viper", house: martell)
            let edmure   = Person(name: "Edmure", house: tully)
            
            // Añadimos personajes a las casas
            stark.add(persons: robb, arya)
            lannister.add(persons: tyrion, cersei, jaime)
            targaryen.add(person: daenerys)
            greyjoy.add(person: theon)
            tyrrel.add(person: margaery)
            baratheon.add(person: joffrey)
            arryn.add(person: lysa)
            martell.add(person: oberyn)
            tully.add(person: edmure)
            
            return [stark, lannister, targaryen, greyjoy, tyrrel, baratheon, arryn, martell, tully].sorted()
            
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
