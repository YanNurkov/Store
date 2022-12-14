//
//  JSONModel.swift
//  Store
//
//  Created by Ян Нурков on 08.12.2022.
//

import Foundation

struct Welcome: Decodable {
    let home_store: [HomeStore]
    let best_seller: [BestSeller]
    
    enum CodingKeys: String, CodingKey {
        case home_store
        case best_seller
    }
}


// MARK: - BestSeller
struct BestSeller: Decodable {
    let id: Int
    let is_favorites: Bool
    let title: String
    let price_without_discount: Int
    let discount_price: Int
    let picture: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case is_favorites
        case title
        case price_without_discount
        case discount_price
        case picture
    }
}

struct HomeStore: Decodable {
    let id: Int
    let is_new: Bool?
    let title : String
    let subtitle: String
    let picture: String
    let is_buy: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case is_new
        case title, subtitle, picture
        case is_buy
    }
}



