//
//  SearchNavigator.swift
//  TMDbCore
//
//  Created by Manuel Colmenero Navarro on 7/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

// Protocolo de SearchNavigator por si se desea reemplazar

protocol SearchNavigator {
    func installSearch(viewController: UIViewController)
}
