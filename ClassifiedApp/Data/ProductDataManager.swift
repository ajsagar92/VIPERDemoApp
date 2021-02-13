//
//  ProductDataManager.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import Foundation
import Alamofire

class ProductDataManager: NSObject {
    
    static let instance: ProductDataManager = ProductDataManager()
    
    private override init() {}
    
    
    func getProducts<T: Codable>(onCompletion: @escaping ([T]?, AppError?) -> ()) {
        
        AF.request(withRequest: ProductsRequest.fetch).responseDecodable(of: Result<T>.self)
        { (data) in
            guard let response = data.response else {
                return
            }
            switch(response.statusCode) {
            case 200:
                guard let list = data.value else {
                    //Need to pass error
                    onCompletion(nil, nil)
                    return
                }
                onCompletion(list.data, nil)
                break
            default:
                //Need to pass error
                onCompletion(nil, nil)
                break
            }
            
        }
    }

}
