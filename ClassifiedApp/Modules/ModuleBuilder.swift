//
//  ModuleBuilder.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import UIKit

protocol ModuleBuilder {
    static func build<T: Codable>(withStoryboardIdentifier: StoryboardIdentifier, withData: T?) -> UIViewController
}
