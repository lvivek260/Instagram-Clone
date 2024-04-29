//
//  SearchVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 23/04/24.
//

import UIKit

class SearchVC: UIViewController, UISearchBarDelegate, UISearchResultsUpdating{
    @IBOutlet weak var searchTblView: UITableView!{
        didSet{
            searchTblView.register(SearchCell1.nib, forCellReuseIdentifier: SearchCell1.id)
            searchTblView.register(SearchCell2.nib, forCellReuseIdentifier: SearchCell2.id)
            searchTblView.register(SearchCell3.nib, forCellReuseIdentifier: SearchCell3.id)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension SearchVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNo = indexPath.row % 4
        
        switch cellNo{
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell2.id, for: indexPath) as? SearchCell2{
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell1.id, for: indexPath) as? SearchCell1{
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell3.id, for: indexPath) as? SearchCell3{
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell1.id, for: indexPath) as? SearchCell1{
                return cell
            }
        }
        
        fatalError()
    }
}
