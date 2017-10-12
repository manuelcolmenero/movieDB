//
//  SearchAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class SearchAssembly {
    // Se inyectan las dependencias necesarias
    private let imageLoadingAssembly: ImageLoadingAssembly
    private let detailAssembly: DetailAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly,
         detailAssembly: DetailAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly       = detailAssembly
    }
    
    // Instancia del SearchNavigator
    func searchNavigator() -> SearchNavigator{
        return PhoneSearchNavigator(viewControllerProvider: self)
    }
    
    func presenter() -> SearchResultsPresenter {
        return SearchResultsPresenter(detailNavigator: detailAssembly.detailNavigator())
    }
    
    func resultPresenter() -> SearchResultPresenter {
        return SearchResultPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
}

// Extension para implementar SearchResultsViewControllerProvider para crear instancias
extension SearchAssembly: SearchResultsViewControllerProvider {
    func searchResultsViewController() -> SearchResultsViewController {
        return SearchResultsViewController(presenter: presenter(),
                                           resultPresenter: resultPresenter())
    }
    
}
