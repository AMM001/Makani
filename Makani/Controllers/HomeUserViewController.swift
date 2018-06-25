//
//  HomeUserViewController.swift
//  Makani
//
//  Created by mac on 6/2/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import BTNavigationDropdownMenu
import ImageSlideshow
import SDWebImage

class HomeUserViewController: UIViewController {
    
    let items = ["Cairo", "Alexandria", "Ismailia", "Damnhour", "Tanta"]    
    var menuView: BTNavigationDropdownMenu!
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    @IBOutlet weak var tableview: UITableView!
    
    var spaces_Array = [Space]()
    
    let localSource = [ImageSource(imageString: "event1")!, ImageSource(imageString: "event2")!, ImageSource(imageString: "event3")!, ImageSource(imageString: "event4")!]
    
    let sdWebImageSource = [SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        custimzeMenu()
        custimzeSlideImage()
        tableview.delegate   = self
        tableview.dataSource = self
        
        TopRatedByGovernment.topRatedSpace(government: "cairo") { (error, result) in
            if(error == nil){
                self.spaces_Array = result as! [Space]
                self.tableview.reloadData()
            }
        }
    }
    
    @objc func didTapImage() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    
    
    
    @IBAction func openMenuBtn(_ sender: Any) {
        
        self.slideMenuController()?.openLeft()
    }
    
    @IBAction func notificationBtn(_ sender: Any) {
        
        let notificationVC = storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        self.present(notificationVC, animated: true, completion: nil)
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        
        let searchVc = storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        self.present(searchVc, animated: true, completion: nil)
    }
    
}

extension HomeUserViewController : UITableViewDelegate  , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        return spaces_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "spaceCell", for: indexPath) as! SpacesTableViewCell
        cell.spaceName.text    =  spaces_Array[indexPath.row].name
        //        cell.spaceAddress = spaces_Array[indexPath.row].
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let spaceDetail = self.storyboard?.instantiateViewController(withIdentifier: "spaceDetail") as! SpaceDetailsViewController
        spaceDetail.space = spaces_Array[indexPath.row]
        self.present(spaceDetail, animated: true, completion: nil)
    }
}


extension HomeUserViewController {
    
    
    func custimzeMenu() {
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green:180/255.0, blue:220/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: BTTitle.index(0), items: items)
        
        
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.white
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .left // .Center // .Right // .Left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = UIColor.black
        menuView.maskBackgroundOpacity = 0.3
        
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> Void in
            switch indexPath {
            case 0:
                self.spaces_Array.removeAll()
                print("cairo")
                TopRatedByGovernment.topRatedSpace(government: "cairo") { (error, result) in
                    if(error == nil){
                        self.spaces_Array = result as! [Space]
                        self.tableview.reloadData()
                    }
                }
            case 1:
                self.spaces_Array.removeAll()
                print("alex")
                TopRatedByGovernment.topRatedSpace(government: "alexandria") { (error, result) in
                    if(error == nil){
                        self.spaces_Array = result as! [Space]
                        self.tableview.reloadData()
                    }
                }
            case 2:
                self.spaces_Array.removeAll()
                print("ismailia")
                TopRatedByGovernment.topRatedSpace(government: "ismailia") { (error, result) in
                    if(error == nil){
                        self.spaces_Array = result as! [Space]
                        self.tableview.reloadData()
                    }
                }
            case 3:
                self.spaces_Array.removeAll()
                print("damnhour")
                TopRatedByGovernment.topRatedSpace(government: "damnhour") { (error, result) in
                    if(error == nil){
                        self.spaces_Array = result as! [Space]
                        self.tableview.reloadData()
                    }
                }
            case 4:
                self.spaces_Array.removeAll()
                print("tanta")
                TopRatedByGovernment.topRatedSpace(government: "tanta") { (error, result) in
                    if(error == nil){
                        self.spaces_Array = result as! [Space]
                        self.tableview.reloadData()
                    }
                }
            default:
                self.spaces_Array.removeAll()
                print("cairo")
                TopRatedByGovernment.topRatedSpace(government: "cairo") { (error, result) in
                    if(error == nil){
                        self.spaces_Array = result as! [Space]
                        self.tableview.reloadData()
                    }
                }
            }
        }
        
        self.navigationItem.titleView = menuView
    }
    
    func custimzeSlideImage()  {
        
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = .insideScrollView
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.activityIndicator = pageControl as? ActivityIndicatorFactory
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { page in
            //  print("current page:", page)
        }
        
        
        slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        slideshow.addGestureRecognizer(recognizer)
        
        
    }
    
    
}
