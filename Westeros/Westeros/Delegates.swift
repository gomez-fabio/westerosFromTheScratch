//
//  Delegates.swift
//  Westeros
//
//  Created by Fabio Gomez on 27/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//


import UIKit

// Creamos una clase genérica base y heredamos de ella para cada caso particular
class BaseViewControllerDelegate<Element>: NSObject{
    var source : ArrayDataSource<Element>?
    weak var viewController : UIViewController?
}


final class GreatHousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if let house = source?.element(atIndexPath: indexPath), let nav = viewController?.navigationController{
            
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true)
        }
    }
}


final class GreatSeasonsDelegate: BaseViewControllerDelegate<Season>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let season = source?.element(atIndexPath: indexPath), let nav = viewController?.navigationController{
            
            let datasource = DataSources.episodeDataSource(model: season.sortedEpisodes())
            let vc = ArrayTableViewController(dataSource: datasource, title: "Episodes", style: .plain, delegate: GreatEpisodesDelegate())
            nav.pushViewController(vc, animated: true)
        }
    }
}

final class GreatEpisodesDelegate: BaseViewControllerDelegate<Episode>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let episode = source?.element(atIndexPath: indexPath), let nav = viewController?.navigationController{
            
            let vc = EpisodeViewController(model: episode)
            nav.pushViewController(vc, animated: true)
        }
    }
}
