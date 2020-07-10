//
//  ProductCell.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 22/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Kingfisher

protocol ProductCellDelegate : class {
    
    func productFavorited(product : Product)
}

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: RoundedImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate : ProductCellDelegate?
    private var product : Product!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(product: Product, delegate: ProductCellDelegate) {
        
        self.product = product
        self.delegate = delegate
        productTitle.text = product.name
        
        if let url = URL(string: product.imageURL) {
            
            let placeholder = UIImage(named: AppImages.placeholder)
            productImage.kf.indicatorType = .activity
        
            let options : KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.2))]
            productImage.kf.setImage(with: url, placeholder: placeholder, options: options)
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.uk
        
        if let price = formatter.string(from: product.price as NSNumber) {
            productPrice.text = price
        }

        if UserService.favorites.contains(product) {
            favoriteButton.setImage(UIImage(named: AppImages.filledStart), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: AppImages.emptyStart), for: .normal)
        }
    }

    @IBAction func addToCartClicked(_ sender: Any) {
    }
    
    @IBAction func favoriteClicked(_ sender: Any) {
        delegate?.productFavorited(product: product)
    }
}
