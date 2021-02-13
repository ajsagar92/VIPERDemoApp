//
//  ProductModuleBuilder.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import UIKit

class ProductListModuleBuilder: ModuleBuilder {
    
    static func build<T>(withStoryboardIdentifier: StoryboardIdentifier, withData: T?) -> UIViewController {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let viewController = main.instantiateViewController(withStoryboardIdentifier: withStoryboardIdentifier) as! ProductListTableViewController
        
        let interactor = ProductTableViewInteractor()
        let router = ProductTableViewRouter(withViewController: viewController)
        
        let presenter = ProductTableViewPresenter(withViewController: viewController, withInteractor: interactor, withRouter: router)
        viewController.presenter = presenter
        
        return viewController
    }
    

}
