//
//  CartViewModel.swift
//  Store
//
//  Created by Ян Нурков on 13.12.2022.
//

import Foundation

class CartViewModel: NSObject, ObservableObject {
    
    
    @Published var delivery = ""
    @Published var total = ""
    
    private var httpRequest: HttpRequestHelper!
    private(set) var empData: [Basket]! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    private(set) var empDataText: [Cart]! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.httpRequest = HttpRequestHelper()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.httpRequest.getDataCart { (empData) in
            self.empData = empData.basket
            self.delivery = empData.delivery
            self.total = String("$ \(empData.total)")
            print(empData)
        }
    }
}
