//
//  StripeCart.swift
//  Artable
//
//  Created by Cristian Sedano Arenas on 10/07/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

let stripeCart = _StripeCart()

final class _StripeCart {
    
    var cartItems = [Product]()
    
    // variables for Stripe processing fees
    private let stripecreditCartCut = 0.029
    private let flatFeeCents = 30
    var shippingFees = 0
    
    // variables for subTotal, processing fees total
    var subTotal: Int {
        var amount = 0
        
        for item in cartItems {
            
            let pricePennis = Int(item.price * 100)
            amount += pricePennis
        }
        return amount
    }
    
    var processingFees: Int {
        
        if subTotal == 0 {
            return 0
        }
        
        let sub = Double(subTotal)
        let feesAndSub = Int(sub * stripecreditCartCut) - flatFeeCents
        return feesAndSub
    }
    
    var total: Int {
        return subTotal + processingFees + shippingFees
    }
    
    func addItemToCart(item: Product) {
        cartItems.append(item)
    }
    
    func removeItemFromcart(item: Product) {
        
        if let index = cartItems.firstIndex(of: item) {
            cartItems.remove(at: index)
        }
    }
    
    func clearCart() {
        cartItems.removeAll()
    }
}
