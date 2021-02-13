//
//  ProductTableCellInteractor.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 14/02/2021.
//

import UIKit
import Kingfisher

protocol ProductCellInteractor {
    
    func getCurrency() -> String?
    func getPrice() -> Double
    func getThumbnailImage(onCompletion: @escaping (UIImage?, AppError?) -> ())
    
}

class ProductTableCellInteractor: NSObject {
    
    fileprivate var product: Product?
    
    init(withProduct: Product?) {
        self.product = withProduct
    }

}


extension ProductTableCellInteractor: ProductCellInteractor {
    
    func getCurrency() -> String? {
        return ""
    }
    
    func getPrice() -> Double {
        return 0
    }
    
    func getThumbnailImage(onCompletion: @escaping (UIImage?, AppError?) -> ()) {
        
        guard product?.imageThumbnails?.count ?? 0 > 0, let imageThumbnails = product?.imageThumbnails else {
            return
        }
        
        guard let imageUrl = URL(string: imageThumbnails[0]) else {
            return
        }
        
//        guard let imageUrl = URL(string: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png") else {
//            return
//        }
        
        let resource = ImageResource(downloadURL: imageUrl)
        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
                case .success(let value):
                    DispatchQueue.main.async { [] in
                        onCompletion(value.image, nil)
                    }
                case .failure(let error):
                    print("Error: \(error)")
            }
            
            
        }
    }
    
}
