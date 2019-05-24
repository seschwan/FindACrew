//
//  PersonSearchTableViewController.swift
//  FindACrew
//
//  Created by Seschwan on 5/23/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class PersonSearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Properties & Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    let personController = PersonController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self

        
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = self.searchBar.text else { return }
        
        self.personController.searchForPeopleWith(searchTerm: searchTerm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.personController.people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        let person = self.personController.people[indexPath.row]
        cell.person = person

        // Configure the cell...

        return cell
    }
    


}
