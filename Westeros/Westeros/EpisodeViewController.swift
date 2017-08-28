//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Fabio Gomez on 27/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var EpisodeSynopsisView: UITextView!
    
    let model : Episode
    
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.title
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel() {
        episodeImageView.image   = model.image
        EpisodeSynopsisView.text = model.synopsis
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }

}
