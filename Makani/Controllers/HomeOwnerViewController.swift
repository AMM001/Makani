//
//  HomeOwnerViewController.swift
//  Makani
//
//  Created by mac on 6/6/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Floaty
import SlideMenuControllerSwift

class HomeOwnerViewController: UIViewController {
    
     @IBOutlet weak var segment: UISegmentedControl!

    let floaty = Floaty()
    let item1 = FloatyItem()
    let item2 = FloatyItem()
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment.setTitle("Space", forSegmentAt: 0)
        segment.setTitle("Event", forSegmentAt: 1)
        
        
       
      
        item1.buttonColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        item1.icon = UIImage(named:"event iconn")
        item1.iconImageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        item1.titleLabel.backgroundColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        item1.titleLabel.font = UIFont(name: "Roboto-Regular.ttf", size: 2)
        item1.titleLabel.layer.cornerRadius = 10
        item1.title = "Add Event"
        
        item1.handler = {item1 in
            
            print("item1 pressed")
            
        }
        
        item2.buttonColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        item2.icon = UIImage(named:"space icon")
        item2.iconImageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        item2.titleLabel.backgroundColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        item2.titleLabel.font = UIFont(name: "Roboto-Regular.ttf", size: 2)
        item2.titleLabel.layer.cornerRadius = 10
        item2.title = "Add Space"
        
        
        item2.handler = { item2 in
            
            let addSpaceVc = self.storyboard?.instantiateViewController(withIdentifier: "AddSpaceViewController") as! AddSpaceViewController
            self.present(addSpaceVc, animated: true, completion: nil)
        }
      
        floaty.addItem(item: item2)
        floaty.addItem(item: item1)
        

        
      
        floaty.buttonColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        floaty.plusColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        self.view.addSubview(floaty)

    }

    
    
    @IBAction func openMenuBtn(_ sender: Any) {
        
        self.slideMenuController()?.openLeft()

    }
    

   

}
