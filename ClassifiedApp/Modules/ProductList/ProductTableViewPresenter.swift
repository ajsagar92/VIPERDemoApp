//
//  ProductTableViewPresenter.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import Foundation
import UIKit

protocol ProductListPresenter {
    
    var productCount: Int { get }
    func viewDidLoad() -> Void
    func getProduct(at: IndexPath) -> Product?
    func selectProduct(at: IndexPath)
    
}

class ProductTableViewPresenter: NSObject {
    
    private weak var viewController: UIViewController?
    private var interactor: ProductListInteractor
    private var router: ProductListRouter
    
    fileprivate var productList: [Product] = []
    
    init(withViewController: UIViewController, withInteractor: ProductListInteractor, withRouter: ProductListRouter) {
        self.viewController = withViewController
        self.interactor = withInteractor
        self.router = withRouter
    }
}

extension ProductTableViewPresenter: ProductListPresenter {
    
    var productCount: Int {
        return productList.count
    }
    
    func viewDidLoad() -> Void {
        interactor.getProducts { (products, error) in
            guard let productList = products, productList.count > 0 else {
                return
            }
            self.productList = productList
            DispatchQueue.main.async { [weak self] in
                self?.viewController?.notifiyDataUpdate(data: nil)
            }
        }
    }
    
    func getProduct(at: IndexPath) -> Product? {
        if at.row < productCount {
            return productList[at.row]
        }
        else {
            return nil
        }
    }
    
    func selectProduct(at: IndexPath) {
        if (at.row < productCount) {
            self.router.presentProductDetails(forProduct: productList[at.row])
        }
    }
}
