//
//  ViewModel.swift
//  Store
//
//  Created by Ян Нурков on 09.12.2022.
//

import Foundation
class ViewModel: NSObject {
    
    private var httpRequest: HttpRequestHelper!
    private(set) var empData: Welcome! {
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
        self.httpRequest.getDataStart { (empData) in
            self.empData = empData
            print(empData)
        }
    }
}
