//
//  SearchViewController.swift
//  Makani
//
//  Created by mac on 6/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate   = self
        tableview.dataSource = self
        
        segment.setTitle("Space", forSegmentAt: 0)
        segment.setTitle("Event", forSegmentAt: 1)
       // self.searchbar.tintColor = UIColor.white
       // self.searchbar.barStyle = UIBarStyle.black
        


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
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "spaceCell", for: indexPath) as! SpacesTableViewCell
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
    
}
