//
//  LoginVC.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 11/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgotPassClicked(_ sender: UIButton) {
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        
        guard let email = emailText.text, email.isNotEmpty ,
              let pass = passText.text, pass.isNotEmpty else {
                simpleAlert(title: "Error", message: "Please fill out all fields")
                return
        }
        
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: pass) { (authResult, error) in
         
            if let error = error {
                debugPrint(error)
                self.handleFireAuthError(error: error)
                self.activityIndicator.stopAnimating()
                return
            } else {
                self.activityIndicator.stopAnimating()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func guestClicked(_ sender: UIButton) {
    }
}
