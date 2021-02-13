//
//  Result.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 13/02/2021.
//

import Foundation

class Result<T: Codable>: NSObject, Codable {
    
    var data: [T]?
    
    enum CodingKeys: String, CodingKey {
        case data = "results"
    }
    
    required public init(from decoder: Decoder) throws {
        
        // Extract the top-level values ("ProtocolDns")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Extract each property from the nested container
        data = try values.decodeIfPresent([T].self, forKey: .data)
    }

}
