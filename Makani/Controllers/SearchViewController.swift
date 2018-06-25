//
//  SearchViewController.swift
//  Makani
//
//  Created by mac on 6/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import AlgoliaSearch


class SearchViewController: UIViewController {
    //var index = AlgoliaManager.sharedInstance.spacesIndex
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    var spaces = [Space]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        tableview.delegate   = self
        tableview.dataSource = self
        
        segment.setTitle("Space", forSegmentAt: 0)
        segment.setTitle("Event", forSegmentAt: 1)
       // self.searchbar.tintColor = UIColor.white
       // self.searchbar.barStyle = UIBarStyle.black
        
//        index.search(Query(query: "spaces"), completionHandler: { (content, error) -> Void in
//            if error == nil {
//                print("Result: \(content!)")
//            }
//        })
//
//        let query = Query(query: "s")
//        query.attributesToRetrieve = ["firstname", "lastname"]
//        query.hitsPerPage = 50
//        index.search(query, completionHandler: { (content, error) -> Void in
//            if error == nil {
//                print("Result: \(content!)")
//            }
//        })
    }

    @IBAction func cancelSearch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController : UITableViewDelegate  , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "spaceCell", for: indexPath) as! SpacesTableViewCell
        cell.spaceName.text = spaces[indexPath.row].name
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}

extension SearchViewController:UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("search bar begin editing")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Search.search(keyword: searchText) { (error, result) in
            if(error == nil){
                self.spaces = result as! [Space]
                self.tableview.reloadData()
            }
        }
    }
}


