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
// Cogemos la URL de Firebase, y hacemos una pequeña animacion con el Place Holder.
        if let url = URL(string: category.imageURL) {
            
            let placeHolder = UIImage(named: AppImages.placeholder)
            let options : KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.3))]
            categoryImage.kf.indicatorType = .activity
            categoryImage.kf.setImage(with: url, placeholder: placeHolder, options: options)
        }
    }
}
