//
//  Movie.swift
//  MovieSearch
//
//  Created by Razvan Litianu on 7/4/19.
//  Copyright © 2019 Razvan Litianu. All rights reserved.
//

import Foundation

struct Movie {
    let name: String
    let releaseDate: String
}

extension Movie {
    static let all = [Movie(name: "Avatar", releaseDate: "2009"),
                      Movie(name: "Titanic", releaseDate: "1997"),
                      Movie(name: "Star Wars", releaseDate: "1977")
    ]
}
