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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func removeItemClicked(_ sender: Any) {
    }
    
}
