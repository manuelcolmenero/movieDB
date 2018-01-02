//
//  MoviePresenter.swift
//  TMDbCore
//
//  Created by Manuel Colmenero Navarro on 12/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class MoviePresenter : DetailPresenter {
    private let repository     : MovieRepositoryProtocol
    private let dateFormatter  : DateFormatter
    private let detailNavigator: DetailNavigator
    
    
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    weak var view: DetailView?
    
    init(repository: MovieRepositoryProtocol,
         dateFormatter       : DateFormatter,
         identifier          : Int64,
         detailNavigator     : DetailNavigator) {
        self.repository      = repository
        self.dateFormatter   = dateFormatter
        self.identifier      = identifier
        self.detailNavigator = detailNavigator
    }
    
    func didLoad() {
        view?.setLoading(true)
        
        repository.movie(withIdentifier: identifier)
            .map { [weak self] movie in
                self?.detailSections(for: movie) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
                }, onDisposed: { [weak self] in
                    self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterStripItem) {
        detailNavigator.showDetail(withIdentifier: item.identifier, mediaType: .person)
    }
    
    private func detailSections(for movie: MovieDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(movie: movie, dateFormatter: dateFormatter))
        ]
        
        if let overview = movie.overview {
            detailSections.append(.about(title: "Overview", detail: overview))
        }
        
        let items = movie.credits?.cast.map { PosterStripItem(castMember: $0) }
        
        if let items = items {
            detailSections.append(.posterStrip(title: "Cast", items: items))
        }
        
        return detailSections
    }
}

