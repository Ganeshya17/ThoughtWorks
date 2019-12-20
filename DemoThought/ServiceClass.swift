//
//  ServiceClass.swift
//  DemoThought
//
//  Created by Zencode Developer on 20/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//

import Foundation

class ServiceClass {
    
    typealias ProductListHandler = ((_ error: String?, _ list: [Products]) -> Void)
    
    struct ProductListRequest: APITarget {
        var params: Dictionary<String, Any>?
        var path: String = APIPaths.Offerlist
    }
    
    func getProductList(completionHandler: @escaping ProductListHandler)  {
        let request = ProductListRequest()
        Activity.show()
        ConnectionManager.shared().apiCall(with: request, CodableResponse: ListOfProduct.self) { (response, error) in
            DispatchQueue.main.async {
                Activity.hide()
                if let error = error {
                    completionHandler(error.localizedDescription, [])
                    return
                }
                if let response = response {
                    completionHandler(nil, response)
                }
            }
            
        }
    }
}
