//
//  HostViewController.swift
//  Makani
//
//  Created by mac on 6/2/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class HostViewController: MenuContainerViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        menuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuItemContentViewController") as! MenuViewController
        contentViewControllers = contentControllers()
        selectContentViewController(contentViewControllers.first!)

    }

  

    private func contentControllers() -> [MenuItemContentViewController] {
        var contentList = [MenuItemContentViewController]()
        contentList.append(self.storyboard?.instantiateViewController(withIdentifier: "First") as! MenuItemContentViewController)
        
        contentList.append(self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! MenuItemContentViewController)
        return contentList
    }

}
