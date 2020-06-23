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
    
    init(data : [String : Any ] ) {
        
        self.name = data["name"] as? String ?? ""
        self.id = data["id"] as? String ?? ""
        self.imageURL = data["imageURL"] as? String ?? ""
        self.isActive = data["isActive"] as? Bool ?? true
        self.timeStamp = data["timeStamp"] as? Timestamp ?? Timestamp()
    }
}
