//
//  User.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 12/1/21.
//

import Foundation

struct User: Decodable {
    
    enum CodingKeys: String, CodingKey {
        
//        let name: String
        
        case fullName = "name"
    }
    
    let fullName: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fullName = try container.decode(String.self, forKey: .fullName)
    }
}
