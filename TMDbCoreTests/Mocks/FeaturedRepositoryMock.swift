//
//  FeaturedRepositoryMock.swift
//  TMDbCoreTests
//
//  Created by Manuel Colmenero Navarro on 8/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

@testable import TMDbCore
import RxSwift

final class FeaturedRepositoryMock: FeaturedRepositoryProtocol {
    // Movies
    private(set) var moviesNowPlayingCalled     = false
    private(set) var moviesNowPlayingParameters : String?
    
    var moviesNowPlayingResult = Observable<[Movie]>.just([])

    // Shows
    private(set) var showsOnTheAirCalled = false
    
    var showsOnTheAirResult = Observable<[Show]>.just([])

    func moviesNowPlaying(region: String) -> Observable<[Movie]> {
        moviesNowPlayingCalled     = true
        moviesNowPlayingParameters = region
        
        return moviesNowPlayingResult
    }
    
    func showsOnTheAir() -> Observable<[Show]> {
        showsOnTheAirCalled = true
        
        return showsOnTheAirResult
    }
}
