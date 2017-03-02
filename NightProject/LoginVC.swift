//
//  LoginVC.swift
//  NightProject
//
//  Created by Appinventiv on 02/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var googleButton: UIButton!

    @IBOutlet weak var facebookButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleButton.layer.cornerRadius = googleButton.layer.bounds.width/2

           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
  
   
