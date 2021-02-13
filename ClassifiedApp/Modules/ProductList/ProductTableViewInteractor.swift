//
//  ProductTableViewInteractor.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import Foundation

protocol ProductListInteractor {
    
    func getProducts(onCompletion: @escaping (Array<Product>?, AppError?) -> ())
    
}

class ProductTableViewInteractor: NSObject {

    fileprivate var products: [Product] = []
    
}

extension ProductTableViewInteractor: ProductListInteractor {
    
    func getProducts(onCompletion: @escaping (Array<Product>?, AppError?) -> ()) {
        if (self.products.count > 0) {
            onCompletion(self.products, nil)
        }
        else {
            ProductDataManager.instance.getProducts { (products: [Product]?, appError: AppError?) in
                guard let productList = products else {
                    self.products = [];
                    
                    onCompletion(nil, nil)
                    return
                }
                self.products = productList
                onCompletion(productList, nil)
            }
        }
    }
    
    
    
    
    
    
}
