//
//  RegisterVC.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 11/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    // Oulets
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var conformPassText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImage: UIImageView!
    @IBOutlet weak var conformPassCheckImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        conformPassText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let passText = passwordText.text else { return }
        
        //if we have started typing in the confirm pass text field
        if textField == conformPassText {
            
            passCheckImage.isHidden = false
            conformPassCheckImage.isHidden = false
            
        } else {
            
            // clear text field
            if passText.isEmpty {
                
                passCheckImage.isHidden = true
                conformPassCheckImage.isHidden = true
                conformPassText.text = ""
            }
        }
        
       // Make it so when the password match, the checkmarks turn green
        if passwordText.text == conformPassText.text {
            
            passCheckImage.image = UIImage(named: "green_check")
            conformPassCheckImage.image = UIImage(named: "green_check")
            
        } else {
            
            passCheckImage.image = UIImage(named: "red_check")
            conformPassCheckImage.image = UIImage(named: "red_check")
        }
    }
    
    @IBAction func registerClicked(_ sender: UIButton) {
        
        guard let email = emailText.text, email.isNotEmpty,
              let userName = userNameText.text, userName.isNotEmpty,
              let password = passwordText.text, password.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                
                debugPrint(error)
                return
                
            }
            self.activityIndicator.stopAnimating()
            print("Successfully register")
        }
    }
}
