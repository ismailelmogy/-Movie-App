//
//  ViewController.swift
//  Movies App
//
//  Created by Esraa Hassan on 7/7/19.
//  Copyright © 2019 Developers. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
   
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let requestToken = APICallManager.instance.getRequestToken();
        if (requestToken != "nil"){
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

