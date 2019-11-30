//
//  SearchControllerDataSource.swift
//  MovieSearch
//
//  Created by Razvan Litianu on 7/4/19.
//  Copyright © 2019 Razvan Litianu. All rights reserved.
//

import UIKit

final class SearchControllerDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let movieManager: MovieManager
    
    init(movieManager: MovieManager) {
        self.movieManager = movieManager
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieManager.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        let movie = movieManager.movie(for: indexPath)
        cell.textLabel?.text  = movie.name
        cell.detailTextLabel?.text = movie.releaseDate
        
        return cell
    }
}
