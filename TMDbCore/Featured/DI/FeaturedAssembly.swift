//
//  FeaturedAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

// Se hace publica la clase
// Se añade inyección de DetailAssembly y SearchAssembly
// FeaturePresenter
final public class FeaturedAssembly {
    private let imageLoadingAssembly: ImageLoadingAssembly
    private let detailAssembly: DetailAssembly
    private let searchAssembly: SearchAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly,
         detailAssembly: DetailAssembly,
         searchAssembly: SearchAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly       = detailAssembly
        self.searchAssembly       = searchAssembly
    }
    
    // Se hace publico el método
    // Devuelve un UIViewController. En lugar de hacer FeaturedViewController publico, puesto que no interesa hacerlo,
    // se indica que devuelva un UIViewController, que es lo que al final es FeaturedViewController
    public func viewController() -> UIViewController {
        return FeaturedViewController(presenter: presenter(),
                                      cardPresenter: cardPresenter(),
                                      searchNavigator: searchAssembly.searchNavigator())
    }
    
    func presenter() -> FeaturedPresenter {
        return FeaturedPresenter(detailNavigator: detailAssembly.detailNavigator())
    }
    
    func cardPresenter() -> CardPresenter {
        return CardPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
}
