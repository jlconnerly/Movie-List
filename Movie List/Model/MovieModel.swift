//
//  MovieModel.swift
//  Movie List
//
//  Created by Jake Connerly on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Movie {
    let name: String
    var seen: Bool
    
    init(name: String) {
        self.name = name
        self.seen = false
    }
    
}
