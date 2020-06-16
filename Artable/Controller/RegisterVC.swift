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
    @IBOutlet weak var confirmPassText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImage: UIImageView!
    @IBOutlet weak var conformPassCheckImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPassText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let passText = passwordText.text else { return }
        
        //if we have started typing in the confirm pass text field
        if textField == confirmPassText {
            passCheckImage.isHidden = false
            conformPassCheckImage.isHidden = false
        } else {
            // clear text field
            if passText.isEmpty {
                passCheckImage.isHidden = true
                conformPassCheckImage.isHidden = true
                confirmPassText.text = ""
            }
        }
        
       // Make it so when the password match, the checkmarks turn green
        if passwordText.text == confirmPassText.text {
            passCheckImage.image = UIImage(named: AppImages.GreenCheck)
            conformPassCheckImage.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passCheckImage.image = UIImage(named: AppImages.RedCheck)
            conformPassCheckImage.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    @IBAction func registerClicked(_ sender: UIButton) {
        
        guard let email = emailText.text, email.isNotEmpty,
              let userName = userNameText.text, userName.isNotEmpty,
              let password = passwordText.text, password.isNotEmpty else {
                simpleAlert(title: "Error", message: "Please fill out all fields.")
                return
        }
        
        guard let confirmPass = confirmPassText.text, confirmPass == password else {
            simpleAlert(title: "Error", message: "Password do not match")
            return
        }
        
        activityIndicator.startAnimating()
        
        guard let authUser = Auth.auth().currentUser else { return }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        authUser.link(with: credential) { (result, error) in
            if let error = error {
                debugPrint(error)
                self.handleFireAuthError(error: error)
                self.activityIndicator.stopAnimating()
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
}
