//
//  API.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 13/02/2021.
//

import Foundation

enum API: String {
    
    case ProductAPI = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
    
    var string: String {
        return rawValue
    }
}
