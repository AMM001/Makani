
//
//  SplashScreenViewController.swift
//  Makani
//
//  Created by mac on 6/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var fcview: UIView!
    
    // var buttoncons: [NSLayoutConstraint]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                            type: NVActivityIndicatorType.ballBeat)
        activityIndicatorView.padding = 30
        
        self.fcview.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        
        perform(#selector(self.Start), with: nil, afterDelay:5)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @objc func Start ()
    {
        let fvc = storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        self.present(fvc, animated: true, completion: nil)
        
    }
    
    

}
