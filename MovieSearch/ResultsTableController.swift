/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The table view controller responsible for displaying the filtered products as the user types in the search field.
*/

import UIKit

class ResultsTableController: UITableViewController {
    
    var searchResultsManager: SearchResultsManager! {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsManager.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        let movie = searchResultsManager.movie(for: indexPath)
        cell.textLabel?.text  = movie.name
        cell.detailTextLabel?.text = movie.releaseDate
        
        return cell
    }
}
