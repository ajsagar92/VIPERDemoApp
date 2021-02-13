//
//  ProductTableViewInteractor.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import Foundation

protocol ProductInteractor {
    
    func getCurrency() -> String?
    func getPrice() -> Double
    
}

class ProductDetailInteractor: NSObject {

    fileprivate var product: Product!
    
    init(withProduct: Product) {
        self.product = withProduct
    }
    
}

extension ProductDetailInteractor: ProductInteractor {
    
    func getCurrency() -> String? {
        guard let components = product.price?.components(separatedBy: " "), components.count>=2 else {
            return nil
        }
        return components[0]
    }
    
    func getPrice() -> Double {
        guard let components = product.price?.components(separatedBy: " "), components.count>=2 else {
            return 0
        }
        return Double(components[1]) ?? 0
        
    }
    
    
}
