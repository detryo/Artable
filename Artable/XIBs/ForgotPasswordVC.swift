//
//  ForgotPasswordVC.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 16/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordVC: UIViewController {
    
    // Oulets
    @IBOutlet weak var emailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Reset email and send email to inbox
    @IBAction func resetClicked(_ sender: UIButton) {
        
        guard let email = emailText.text, email.isNotEmpty else {
            simpleAlert(title: "Error", message: "Please enter email")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            if let error = error {
                self.handleFireAuthError(error: error)
                debugPrint(error.localizedDescription)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}