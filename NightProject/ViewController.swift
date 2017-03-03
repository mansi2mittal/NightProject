//
//  ViewController.swift
//  NightProject
//
//  Created by Appinventiv on 01/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {
    
    //OUTLETS
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var sliderBelowButton: UIView!
    
    @IBOutlet weak var bottomConstraintOfScrollView: NSLayoutConstraint!
    
    // MARK: VIEW LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        // ADDING OBSERVER TO THE NOTIFICATION CENTER AS TO REDUCE THE BOTTOM CONSTRAINT OF THE SCROLL VIEW WHEN THE KEYBOARD APPEARS
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
            
            guard let userinfo = Notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
                else{ return }
            
            let keyboardHeight = userinfo.cgRectValue.height
            
            
            self.bottomConstraintOfScrollView.constant = keyboardHeight - 130
            
        })
        
        // ADDING THE OBSERVER FOR HIDING THE KEYBOARD
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
            
            self.bottomConstraintOfScrollView.constant = 0
            
        })
        
        // SETTING THE FRAME OF THE SCROLL VIEW
       
        self.scrollView.frame = CGRect( x: 0 , y: 243 , width : self.view.frame.width , height: 324)
     
        let signInVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVCID") as! LoginVC
        
        // SETTING THE FRAME OF THE SIGNIN VC
        
        signInVc.view.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        
        // ADDING SIGNIN VC AS A CHILD VIEW CONTROLLER
        
        self.addChildViewController(signInVc)
        
        self.scrollView.addSubview((signInVc.view)!)
        
        // MOVING TO THE PARENT VC
        
        signInVc.didMove(toParentViewController: self)
        
        // SETTING THE FRAME OF THE SIGNUP VC
        
        let signUpVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVCID") as! SignUpVC
       
        signUpVc.view.frame = CGRect(x: self.scrollView.frame.width, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        
        // ADD AS A CHILD VC
        
        self.addChildViewController(signUpVc)
        
        // MOVING TO THE PARENT VC
        
        signUpVc.didMove(toParentViewController: self)
        
        self.scrollView.addSubview(signUpVc.view)
        
        self.scrollView.contentSize = CGSize(width: (self.scrollView.frame.width) * 2, height: self.scrollView.frame.height)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // ACTION FOR THE TAP ON THE SIGNUP BUTTON
   
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
    
    // ACTION ON THE TAP OF THE SIGN IN BUTTON
    
    @IBAction func signInButtonTapped(_ sender: Any) {
  
        
            sliderBelowButton.frame = CGRect( x: 00 , y: 235 , width : 80 , height: 10)
            
            let signInVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVCID") as! LoginVC
            
            signInVc.view.frame = self.scrollView.bounds
            
            self.addChildViewController(signInVc)
            
            self.scrollView.addSubview((signInVc.view)!)
            
            signInVc.didMove(toParentViewController: self)

        }
    
    // WHEN THE SCROLL HAPPENS THE SLIDER VIEW THAT HAS BEEN TAKEN IS SEEN MOVING WITH ANIMATION
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        let multiplier = self.scrollView.frame.width/self.sliderBelowButton.frame.width
        
        let scrollPoint = scrollView.contentOffset.x
        
        self.sliderBelowButton.transform = CGAffineTransform(translationX: scrollPoint/multiplier , y: 0)

    }
        
        
    }


