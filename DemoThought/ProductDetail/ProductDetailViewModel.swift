//
//  ProductDetailViewModel.swift
//  DemoThought
//
//  Created by Zencode Developer on 21/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//

import Foundation

class ProductDetailViewModel {
    
    private let product: Product
    let name: String
    let imageUrl: String
    
    init(product: Product) {
        self.product = product
        name = product.name
        imageUrl  = product.image
    }
    
    var price: String{
        guard let offer = product.offerPrice else {
            return product.price
        }
        return offer
    }
}
