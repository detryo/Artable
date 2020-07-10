//
//  CheckoutVC.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 10/07/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var paymentMethodButton: UIButton!
    @IBOutlet weak var shippingMethodButton: UIButton!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var processingFeeLabel: UILabel!
    @IBOutlet weak var shippingCostLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func placeOrderClicked(_ sender: Any) {
        
    }
    
    @IBAction func paymentMethodClicked(_ sender: Any) {
        
    }
    
    @IBAction func shippingMethodClicked(_ sender: Any) {
        
    }
    
}
