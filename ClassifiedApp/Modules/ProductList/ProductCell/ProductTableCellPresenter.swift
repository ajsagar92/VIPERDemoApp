//
//  ProductTableViewCellInteractor.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 13/02/2021.
//

import Foundation
import UIKit
import Kingfisher

protocol ProductCellPresenter {
    
    func getName() -> String?
    func getDate() -> String?
    func getPrice() -> String?
    func getUid() -> String?
    func getThumbmailImage(onCompletion: @escaping (UIImage?, AppError?) -> ())
    
}

class ProductTableCellPresenter: NSObject {
    
    fileprivate var product: Product?
    fileprivate var interactor: ProductCellInteractor
    
    init(withProduct: Product?) {
        self.product = withProduct
        self.interactor = ProductTableCellInteractor(withProduct: withProduct)
    }

}

extension ProductTableCellPresenter: ProductCellPresenter {
    
    func getName() -> String? {
        return product?.name
    }
    
    func getDate() -> String? {
        guard let createdDate = product?.createdDate else {
            return ""
        }
        
        let dateComponents = createdDate.components(separatedBy: " ")
        
        guard dateComponents.count > 0 else {
            return ""
        }
        return dateComponents[0]
    }
    
    func getPrice() -> String? {
        return product?.price
    }
    
    func getUid() -> String? {
        return product?.uid
    }
    
    func getThumbmailImage(onCompletion: @escaping (UIImage?, AppError?) -> ()) {
        self.interactor.getThumbnailImage(onCompletion: onCompletion)
    }
    
}
