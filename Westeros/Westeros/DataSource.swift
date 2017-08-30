//
//  DataSource.swift
//  Westeros
//
//  Created by Fabio Gomez on 27/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

final class DataSources {
    
    static func houseDataSource (model: [House]) -> ArrayDataSource<House>{
        
        return ArrayDataSource(model: model, cellMaker: { (house: House, tableview: UITableView) -> UITableViewCell in
            
            let cellID = "House"
            var cell   = tableview.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image      = house.sigil.image
            cell?.textLabel?.text       = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            return cell!
        })
    }

    static func personDataSource (model: [Person]) -> ArrayDataSource<Person>{
        return ArrayDataSource(model: model, cellMaker: { (person: Person, tableview: UITableView) -> UITableViewCell in
            
            let cellID = "Person"
            var cell   = tableview.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text       = person.fullName
            cell?.detailTextLabel?.text = person.alias
            
            return cell!
        })
    }
    
    static func seasonDataSource(model: [Season]) -> ArrayDataSource<Season> {
        
        return ArrayDataSource(model: model, cellMaker: { (season: Season, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Season"
            var cell   = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text       = season.name
            cell?.imageView?.image      = season.image
            cell?.detailTextLabel?.text = season.releaseDate.stringToDate()
            
            return cell!
        })
    }
    
    static func episodeDataSource(model: [Episode]) -> ArrayDataSource<Episode> {
        
        return ArrayDataSource(model: model, cellMaker: { (episode: Episode, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Episode"
            var cell   = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text       = episode.title
            cell?.imageView?.image      = episode.image
            cell?.detailTextLabel?.text = episode.airDate.stringToDate()
            
            return cell!
        })
    }

}
