//
//  MembersTableViewController.swift
//  Westeros
//
//  Created by Fabio Gomez on 27/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class MembersTableViewController: UITableViewController {
    
    let model : [Person]
    
    init(model: [Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "PersonCell"
        
        // Descubrir cual es la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        // Crear una celda, primero intento reusar alguna, y si no está disponible...
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        // ..., si no está disponible, la creo
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar Person -> Cell
        cell?.textLabel?.text  = person.fullName
        
        return cell!
    }
    
    // MARK: - Table view delegate
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        // Averiguamos cuál es la persona...
//        let person = model[indexPath.row]
//        // ...y la mostramos
//        let personVC = HouseViewController(model: person)
//        navigationController?.pushViewController(personVC, animated: true)
//    }
    
}
