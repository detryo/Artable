//
//  Constants.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 11/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import Foundation
import UIKit

struct Storyboard {
    
    static let LoginStoryboard = "LoginStoryboard"
    static let Main = "Main"
}

struct StoryboardID {
    
    static let LoginVC = "LoginVC"
}

struct AppImages {
    
    static let GreenCheck = "green_check"
    static let RedCheck = "red_check"
    static let filledStart = "filled_star"
    static let emptyStart = "empty_star"
    static let placeholder = "placeholder"
}

struct AppColors {
    
    static let Blue = #colorLiteral(red: 0.2914361954, green: 0.3395442367, blue: 0.4364506006, alpha: 1)
    static let Red = #colorLiteral(red: 0.8881979585, green: 0.3072378635, blue: 0.2069461644, alpha: 1)
    static let OffWhite = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
}

struct Identifiers {
    
    static let categoryCell = "CategoryCell"
    static let productCell = "ProductCell"
    static let cartItemCell = "CartItemCell"
}

struct Segues {
    
    static let toProductsVC = "toProductsVC"
    static let toAddEditCategory = "toAddEditCategory"
    static let toEditCategory = "toEditCategory"
    static let toAddEditProduct = "toAddEditProduct"
    static let toFavorites = "toFavorites"
}
