//
//  UIViewController+Ext.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 13/02/2021.
//

import UIKit

extension UIViewController {
    
    @objc func notifiyDataUpdate(data: Any?) {}
    
    func performSegue(withStoryboardIdentifier: StoryboardIdentifier, sender: Any?) {
        self.performSegue(withIdentifier: withStoryboardIdentifier.rawValue, sender: sender)
    }

}

