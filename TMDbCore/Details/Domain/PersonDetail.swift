//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Manuel Colmenero Navarro on 14/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    let identifier     : Int64
    let biography      : String?
    let posterPath     : String?
    let birthday       : String?
    let deathday       : String?
    let name           : String
    
    private enum CodingKeys: String, CodingKey {
        case identifier    = "id"
        case biography
        case posterPath    = "profile_path"
        case birthday
        case deathday
        case name
    }
}
