//
//  ProductViewModel.swift
//  Store
//
//  Created by Ян Нурков on 12.12.2022.
//

import Foundation

class ProductViewModel: NSObject {
    
    private var httpRequest: HttpRequestHelper!
    private(set) var empData: Products! {
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
        self.httpRequest.getDataProductDetails { (empData) in
            self.empData = [empData]
            print(empData)
        }
    }
}
