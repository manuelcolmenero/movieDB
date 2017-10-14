//
//  DetailHeader+PersonDetail.swift
//  TMDbCore
//
//  Created by Manuel Colmenero Navarro on 14/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(person: PersonDetail, dateFormatter: DateFormatter) {
        title        = person.name
        posterPath   = person.posterPath
        backdropPath = ""
        
        let birthday = person.birthday.flatMap { dateFormatter.date(from: $0)}
        let birthdayYear = (birthday?.year).map { String($0) }
        let deathday = person.deathday.flatMap { dateFormatter.date(from: $0)}
        let deathdayYear = (deathday?.year).map { String($0) }
        
        metadata = [birthdayYear, deathdayYear].flatMap { $0 }.joined(separator: " - ")
    }
}
