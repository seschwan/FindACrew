//
//  Person.swift
//  FindACrew
//
//  Created by Seschwan on 5/23/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

// Key Decoding Strategy

struct Person: Decodable {
    let name:       String
    let gender:     String
    let birthYear:  String
    
    
}


struct PersonSearch: Decodable {
    let results: [Person]
    
}
