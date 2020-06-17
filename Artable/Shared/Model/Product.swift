//
//  Product.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 17/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Product {
    
    var name: String
    var id: String
    var category: String
    var price: Double
    var productDescription: String
    var imageURL: String
    var timeStamp: Timestamp
    var stock: Int
    var favorite: Bool
}
