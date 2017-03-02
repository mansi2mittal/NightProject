//
//  ViewController.swift
//  NightProject
//
//  Created by Appinventiv on 01/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var sliderBelowButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
       
        self.scrollView.frame = CGRect( x: 0 , y: 243 , width : self.view.frame.width , height: 324)
     
        let signInVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVCID") as! LoginVC
        
        signInVc.view.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        
        self.addChildViewController(signInVc)
        
        self.scrollView.addSubview((signInVc.view)!)
        
        signInVc.didMove(toParentViewController: self)
        
        let signUpVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVCID") as! SignUpVC
       
        signUpVc.view.frame = CGRect(x: self.scrollView.frame.width, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        
        self.addChildViewController(signUpVc)
        
        signUpVc.didMove(toParentViewController: self)
        
        self.scrollView.addSubview(signUpVc.view)
        
        
        self.scrollView.contentSize = CGSize(width: (self.scrollView.frame.width) * 2, height: self.scrollView.frame.height)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
   
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        sliderBelowButton.frame = CGRect( x: 80 , y: 235 , width : 80 , height: 10)
        
        let signUpVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVCID") as! SignUpVC

        signUpVc.view.frame = self.scrollView.bounds
        
        self.addChildViewController(signUpVc)
        
        self.scrollView.addSubview((signUpVc.view)!)
       
        signUpVc.didMove(toParentViewController: self)
        
        var signUpFrame : CGRect = signUpVc.view.frame
       
        signUpFrame.origin.x = self.scrollView.frame.width
        
        }
    
    
    @IBAction func signInButtonTapped(_ sender: Any) {
  
        
            sliderBelowButton.frame = CGRect( x: 00 , y: 235 , width : 80 , height: 10)
            
            let signInVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVCID") as! LoginVC
            
            signInVc.view.frame = self.scrollView.bounds
            
            self.addChildViewController(signInVc)
            
            self.scrollView.addSubview((signInVc.view)!)
            
            signInVc.didMove(toParentViewController: self)

        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        let multiplier = self.scrollView.frame.width/self.sliderBelowButton.frame.width
        
        let scrollPoint = scrollView.contentOffset.x
        
        self.sliderBelowButton.transform = CGAffineTransform(translationX: scrollPoint/multiplier , y: 0)

    }
        
        
    }


