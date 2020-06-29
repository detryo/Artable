//
//  ViewController.swift
//  ArtableAdmin
//
//  Created by Cristian Sedano Arenas on 10/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class AdminHomeVC: HomeVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem?.isEnabled = false
        
        let addCategoryButton = UIBarButtonItem(title: "Add Category", style: .plain, target: self, action: #selector(addCategory))
        
        navigationItem.rightBarButtonItem = addCategoryButton
    }

    @objc func addCategory() {
        performSegue(withIdentifier: Segues.toAddEditCategory, sender: self)
    }
}
