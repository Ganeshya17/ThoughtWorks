//
//  ProductOffer.swift
//  DemoThought
//
//  Created by Zencode Developer on 20/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//

import Foundation

struct Products: Codable {
    let pid, name, price: String
    let offerPrice, desc: String?
    let image: String
}

typealias ListOfProduct = [Products]


