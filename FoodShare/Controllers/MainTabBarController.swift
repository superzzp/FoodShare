//
//  ViewController.swift
//  FoodShare
//
//  Created by Alex Zhang on 2019-01-05.
//  Copyright © 2019 Alex Zhang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    //create an instance of the MGPhotoHelper object;
    let photoHelper = MGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the completionHandler property of MGPhotoHelper;
        photoHelper.completionHandler = { image in
            print("handle image")
        }
        delegate = self as! UITabBarControllerDelegate
        tabBar.unselectedItemTintColor = .black
        
        
    }
    
    
    
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if (viewController.tabBarItem.tag == 1) {
            photoHelper.presentActionSheet(from: self)
            print("take photo!")
            return false
        }else{
            return true
        }
        
    }
}
