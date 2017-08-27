//
//  HouseViewController.swift
//  Westeros
//
//  Created by Fabio Gomez on 22/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    @IBOutlet weak var wordsView: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    
    // Defino mi modelo
    let model : House
    
    // Inicializador, inicializo la variable y llamo al init de la superclase.
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = model.name // el title obligatoriamente tras la llamada al init de la superclase
    }
    
    // Alguna chapuza relacionada con el uso de nil, se pone y punto.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        // Creamos botón a la barra del nav controller
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        let members = UIBarButtonItem(title: "Members",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayMembers))
        
        // Añadimos el botón
        navigationItem.rightBarButtonItems = [members,wiki]
    }
    
    // Con @objc le decimos al compilador que esta función se debe ejecutar con el runtime de ObjC
    @objc func displayWiki(){
        
        // Creamos un WikiVC
        let wikiVC = WikiViewController(model: model)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
        
    }
    
    @objc func displayMembers(){
        let membersVC = MembersTableViewController(model: model.sortedMembers())
        
        navigationController?.pushViewController(membersVC, animated: true)
    }
    
    // Sincronizar vista y modelo
    func syncViewWithModel(){
        houseNameView.text   = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsView.text       = model.words
    }
    
    
    
    // Llamamos a la funcion de sincronización en esta otra función de ciclo de vida del controlador
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
        
    }
    
}
