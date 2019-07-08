//
//  MovieManager.swift
//  MovieSearch
//
//  Created by Razvan Litianu on 7/4/19.
//  Copyright © 2019 Razvan Litianu. All rights reserved.
//

import Foundation
import Combine

final class MovieManager {
    
    @Published public var searchKey: String = ""
    
    public lazy var filterPublisher = {
        $searchKey
            .filter { searchKey in
                searchKey != ""
            }
            .map { [unowned self] searchKey in
                self.filter(by: searchKey)
            }
    }()
    
    let movies: [Movie]
    var count: Int {
        return movies.count
    }
    
    init(movies: [Movie] = Movie.all) {
        self.movies = movies
    }
    
    func movie(for indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
    
    func filter(by searchKey: String) -> [Movie] {
        return movies.filter { $0.name.contains(searchKey) }
    }
}
