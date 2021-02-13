//
//  UIStoryboard.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import UIKit

extension UIStoryboard {
    
    public func instantiateViewController(withStoryboardIdentifier: StoryboardIdentifier) -> UIViewController {
        self.instantiateViewController(identifier: withStoryboardIdentifier.rawValue)
    }

}
