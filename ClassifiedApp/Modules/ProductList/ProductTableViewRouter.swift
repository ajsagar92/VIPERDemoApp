//
//  ProductTableViewRouter.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import Foundation
import UIKit

protocol ProductListRouter {
    func presentProductDetails(forProduct: Product)
}

class ProductTableViewRouter: NSObject {
    
    weak var viewController: UIViewController?
    
    init(withViewController: UIViewController) {
        self.viewController = withViewController
    }

}

extension ProductTableViewRouter: ProductListRouter {
    
    func presentProductDetails(forProduct: Product) {
        let productDetailViewController = ProductDetailModuleBuilder.build(withStoryboardIdentifier: .ProductDetail, withData: forProduct)
        viewController?.navigationController?.pushViewController(productDetailViewController, animated: true)
    }
    
}
