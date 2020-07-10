//
//  CartItemCell.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 10/07/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class CartItemCell: UITableViewCell {
    
    @IBOutlet weak var productImage: RoundedImageView!
    @IBOutlet weak var productTitlelabel: UILabel!
    @IBOutlet weak var removeItemButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(product: Product) {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.uk
        
        if let price = formatter.string(from: product.price as NSNumber) {
            productTitlelabel.text = "\(product.name) \(price)"
        }
        
        if let url = URL(string: product.imageURL) {
            productImage.kf.setImage(with: url)
        }
    }
    
    @IBAction func removeItemClicked(_ sender: Any) {
    }
}
