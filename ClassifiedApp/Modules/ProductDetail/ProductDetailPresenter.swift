//
//  ProductTableViewPresenter.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import Foundation
import UIKit

protocol ProductPresenter {
    
    func viewDidLoad() -> Void
    
    func getName() -> String?
    func getCreatedDate() -> String?
    func getPrice() -> Double
    func getCurrency() -> String?
    func getUID() -> String?
    func getImages() -> [String]
    
    var imagesCount: Int { get }

}

class ProductDetailPresenter: NSObject {
    
    private weak var viewController: UIViewController?
    private var interactor: ProductInteractor
    private var router: ProductRouter
    
    fileprivate var product: Product
    
    init(withViewController: UIViewController, withInteractor: ProductInteractor, withRouter: ProductRouter, withProduct: Product) {
        self.viewController = withViewController
        self.interactor = withInteractor
        self.router = withRouter
        self.product = withProduct
    }
}

extension ProductDetailPresenter: ProductPresenter {
    
    var imagesCount: Int {
        return product.imageUrls?.count ?? 0
    }
    
    func viewDidLoad() -> Void {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.notifiyDataUpdate(data: nil)
        }
    }
    
    func getName() -> String? {
        return product.name
    }
    
    func getCreatedDate() -> String? {
        return product.createdDate
    }
    
    func getPrice() -> Double {
        return self.interactor.getPrice()
    }
    
    func getCurrency() -> String? {
        return self.interactor.getCurrency()
    }
    
    func getUID() -> String? {
        return product.uid
    }
    
    func getImages() -> [String] {
        return product.imageUrls ?? []
    }
}
