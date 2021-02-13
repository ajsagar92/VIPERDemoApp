//
//  Session.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 13/02/2021.
//

import Foundation
import Alamofire

extension Session {
    
    func request(withRequest: AppRequest) -> DataRequest {
        return self.request(withRequest.path.string, method: withRequest.method)
    }
    
    

}
