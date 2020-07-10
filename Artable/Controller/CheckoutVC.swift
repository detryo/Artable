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
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Identifiers.cartItemCell, bundle: nil), forCellReuseIdentifier: Identifiers.cartItemCell)
    }
    
    @IBAction func placeOrderClicked(_ sender: Any) {
        
    }
    
    @IBAction func paymentMethodClicked(_ sender: Any) {
        
    }
    
    @IBAction func shippingMethodClicked(_ sender: Any) {
        
    }
    
}

extension CheckoutVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stripeCart.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.cartItemCell, for: indexPath) as? CartItemCell {
            
            let product = stripeCart.cartItems[indexPath.row]
            cell.configureCell(product: product)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
