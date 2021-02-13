//
//  ProductDetailModuleBuilder.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 13/02/2021.
//

import UIKit

class ProductDetailModuleBuilder: ModuleBuilder {
    
    static func build<T>(withStoryboardIdentifier: StoryboardIdentifier, withData: T?) -> UIViewController {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let viewController = main.instantiateViewController(withStoryboardIdentifier: withStoryboardIdentifier) as! ProductDetailViewController
        
        if let product = withData as? Product {
            let interactor = ProductDetailInteractor(withProduct: product)
            let router = ProductDetailRouter(withViewController: viewController)
            let presenter = ProductDetailPresenter(withViewController: viewController, withInteractor: interactor, withRouter: router, withProduct: product)
            viewController.presenter = presenter
        }
        
        return viewController
    }

}
