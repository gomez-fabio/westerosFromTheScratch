//
//  WikiViewController.swift
//  Westeros
//
//  Created by Fabio Gomez on 26/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    let model : House
    
    init(model: House){
        self.model = model
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Sincronizar vista y modelo
    func syncViewWithModel(){
        
        activityView.isHidden = false
        activityView.startAnimating()
        
        title = model.name
        
        browserView.delegate = self // Hay que indicarle al browser view quien es su delegado
        browserView.loadRequest(URLRequest(url: model.wikiURL))
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        syncViewWithModel()
    }
    
}
                               // Nos hacemos delegado de UIWebView para saber cuando termina de cargar y ocultar el activity
extension WikiViewController : UIWebViewDelegate{
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        activityView.stopAnimating()
        activityView.isHidden = true
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if (navigationType == .linkClicked) ||
           (navigationType == .formSubmitted) {
            return false
        }
        else{
            return true
        }
    }
}

