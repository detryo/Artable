//
//  CategoryCell.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 17/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryImage.layer.cornerRadius = 5
    }

    func configureCell(category: Category) {
        
        categoryLabel.text = category.name
        
        // usamos Kingficher para bajar imagenes, en este caso, de Firebase
        if let url = URL(string: category.imageURL) {
            categoryImage.kf.setImage(with: url)
        }
    }
}
