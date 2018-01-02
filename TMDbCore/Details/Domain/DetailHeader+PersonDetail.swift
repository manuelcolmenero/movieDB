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
        
        // Para la imagen backdropPath se obtiene la que venga de la propia persona
        // en caso de no existir imagen se muestra la imagen de la primera pelicula o serie
        // en la que participe
        backdropPath = person.taggedImages != nil && person.taggedImages?.results.count != 0 ?
            person.taggedImages?.results[0].posterPath :
            person.credits?.cast.first?.posterPath
        
        // Se formatean las fechas para mostrarlas en el detalle
        let birthday = person.birthday.flatMap { dateFormatter.date(from: $0)}
        let birthdayYear = (birthday?.year).map { String($0) }
        let deathday = person.deathday.flatMap { dateFormatter.date(from: $0)}
        let deathdayYear = (deathday?.year).map { String($0) }
        
        metadata = [birthdayYear, deathdayYear].flatMap { $0 }.joined(separator: " - ")
    }
}
