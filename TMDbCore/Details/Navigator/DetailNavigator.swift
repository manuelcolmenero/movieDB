//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Manuel Colmenero Navarro on 7/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

protocol DetailNavigator {
    // Se crea un método para mostar el detalle en base a un identificador y un tipo
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType)
}
