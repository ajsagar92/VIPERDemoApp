//
//  ProductDetailCollectionViewInteractor.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 14/02/2021.
//

import Foundation
import Kingfisher

@objc extension ProductDetailCollectionViewInteractor {
    
    @objc func fetchImage(atIndexPath: NSIndexPath, onCompletion: @escaping (UIImage?) -> Void) {
        
        guard atIndexPath.row < self.images.count, let imageUrl = URL(string: self.images[atIndexPath.row]) else {
            onCompletion(nil)
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
                        onCompletion(value.image)
                    }
                case .failure(let error):
                    print("Error: \(error)")
                    onCompletion(nil)
            }
            
            
        }
        
    }
    
}
