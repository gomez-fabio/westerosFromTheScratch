//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Fabio Gomez on 27/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {

    let dataSource : ArrayDataSource <Element>
    let delegate   : BaseViewControllerDelegate <Element>?
    
    
    init(dataSource : ArrayDataSource<Element>, title: String, style: UITableViewStyle, delegate: BaseViewControllerDelegate<Element>? = nil){
        
        self.dataSource = dataSource
        self.delegate   = delegate
        super.init(style: style)
        self.title = title
        self.delegate?.viewController = self
        self.delegate?.source         = dataSource
        self.tableView.delegate       = (self.delegate as? UITableViewDelegate)
        self.tableView.dataSource     = self.dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
