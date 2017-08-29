//
//  UIKitExtension.swift
//  Westeros
//
//  Created by Fabio Gomez on 23/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: self)
        
        return nav
    }
}
