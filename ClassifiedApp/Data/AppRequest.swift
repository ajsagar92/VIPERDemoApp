//
//  ClassifiedEndpoint.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 13/02/2021.
//

import Foundation
import Alamofire

protocol AppRequest {
    var path: API { get }
    var method: Alamofire.HTTPMethod { get }
}

enum ProductsRequest: AppRequest {
    case fetch
    
        var path: API {
            return API.ProductAPI
        }
        
        var method: Alamofire.HTTPMethod {
            return .get
        }
    
}
