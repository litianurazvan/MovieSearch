//
//  SearchResultsManager.swift
//  MovieSearch
//
//  Created by Razvan Litianu on 7/8/19.
//  Copyright © 2019 Razvan Litianu. All rights reserved.
//

import Foundation

final class SearchResultsManager {
    private let movies: [Movie]
    
    init(filteredProducts: [Movie] = []) {
        movies = filteredProducts
    }
    
    var count: Int { movies.count }
    
    func movie(for indexPath: IndexPath) -> Movie {
        movies[indexPath.row]
    }
}
