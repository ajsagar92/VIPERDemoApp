//
//  ProductTableViewRouter.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import Foundation
import UIKit

protocol ProductRouter {
}

class ProductDetailRouter: NSObject {
    
    weak var viewController: UIViewController?
    
    init(withViewController: UIViewController) {
        self.viewController = withViewController
    }

}

extension ProductDetailRouter: ProductRouter {
    
}
