//
//  HttpRequestHelper.swift
//  Store
//
//  Created by Ян Нурков on 03.12.2022.
//

import Foundation
import Alamofire
 
class HttpRequestHelper: NSObject {
    
    private let url = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    
    func getDataStart(complition: @escaping (Welcome) -> ()) {
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {return}
            do {
                let welcome = try JSONDecoder().decode(Welcome.self, from: data)
                print(welcome.best_seller[2].title)
                complition(welcome)
            } catch {
                print("error decoding == \(error)")
            }
        }
    }
    
    private let urlProduct = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    
    func getDataProductDetails(complition: @escaping (Product) -> ()) {
        
        AF.request(urlProduct, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {return}
            do {
                let product = try JSONDecoder().decode(Product.self, from: data)
                print("!!!!!!!!! \(product.camera)")
                complition(product)
            } catch {
                print("error decoding == \(error)")
            }
        }
    }
    
    private let urlCart = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    func getDataCart(complition: @escaping (Cart) -> ()) {
        
        AF.request(urlCart, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {return}
            do {
                let product = try JSONDecoder().decode(Cart.self, from: data)
                print("!!!!!!!!! \(product.basket[0].title)")
                complition(product)
            } catch {
                print("error decoding == \(error)")
            }
        }
    }
}
