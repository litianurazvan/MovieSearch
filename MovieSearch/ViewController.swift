//
//  ViewController.swift
//  MovieSearch
//
//  Created by Razvan Litianu on 7/4/19.
//  Copyright © 2019 Razvan Litianu. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = searchDataSource
            tableView.delegate = searchDataSource
        }
    }
    
    private var resultsTableController: ResultsTableController!
    private var searchController: UISearchController!
    
    private var filterSubscriber: AnyCancellable?
    
    private let movieManager = MovieManager()
    
    lazy private var searchDataSource: SearchControllerDataSource = {
        SearchControllerDataSource(movieManager: movieManager)
    }()
    
    fileprivate func subscribeWithSink() -> AnyCancellable {
        // Subscribing to a published can be done with sink
        // Subscribe using sink returns a Subscriber protocol type and needs to be type erased
        
        return AnyCancellable(movieManager.filterPublisher.sink { [unowned self] searchResultsManager in
            self.resultsTableController.searchResultsManager = searchResultsManager
        })
    }
    
    fileprivate func subscribeWithAssign() -> AnyCancellable {
        // Another way to subscribe is using assing to which used keypaths to write to an object's property
        
        return movieManager.filterPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.searchResultsManager, on: resultsTableController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        resultsTableController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ResultsTableController")
        resultsTableController.searchResultsManager = SearchResultsManager()
        
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Movies"
        navigationItem.searchController = searchController
        
        
        // Choose one
//        filterSubscriber = subscribeWithSink()
        filterSubscriber = subscribeWithAssign()
        
        definesPresentationContext = true
    }
}

// MARK:- Search Delegate

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchKey = searchController.searchBar.text else { return }
        movieManager.searchKey = searchKey
    }
}
