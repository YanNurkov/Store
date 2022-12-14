//
//  CartModel.swift
//  Store
//
//  Created by Ян Нурков on 13.12.2022.
//

import Foundation

typealias Carts = [Cart]

struct Cart: Decodable {
    let basket: [Basket]
    let delivery: String
    let id: String
    let total: Int
}


// MARK: - Basket
struct Basket: Decodable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}
