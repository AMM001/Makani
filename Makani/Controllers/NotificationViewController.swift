//
//  NotificationViewController.swift
//  Makani
//
//  Created by mac on 6/6/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate   = self
        tableview.dataSource = self
        self.tableview.rowHeight = 80

    }


    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
   

}

extension NotificationViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationCollectionViewCell
        
        return cell
        
    }
    
    
    
    
    
}
