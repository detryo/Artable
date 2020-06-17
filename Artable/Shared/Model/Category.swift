//
//  Category.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 17/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Category {
    
    var name: String
    var id : String
    var imageURL : String
    var isActive : Bool = true
    var timeStamp : Timestamp
}
