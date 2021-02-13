//
//  Product.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import Foundation

@objc public class Product: NSObject, Codable {
    
    @objc var createdDate: String?
    @objc var price: String?
    @objc var name: String?
    @objc var uid: String?
    @objc var imagesIds: [String]?
    @objc var imageUrls: [String]?
    @objc var imageThumbnails: [String]?
    
    enum CodingKeys: String, CodingKey {
        case createdDate = "created_at"
        case price
        case name
        case uid
        case imagesIds = "image_ids"
        case imageUrls = "image_urls"
        case imageThumbnails = "image_urls_thumbnails"
    }
    
    required public init(from decoder: Decoder) throws {
        
        // Extract the top-level values ("ProtocolDns")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Extract each property from the nested container
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
        imagesIds = try values.decodeIfPresent([String].self, forKey: .imagesIds)
        imageUrls = try values.decodeIfPresent([String].self, forKey: .imageUrls)
        imageThumbnails = try values.decodeIfPresent([String].self, forKey: .imageThumbnails)
        
    }
    

    
    
    
}
