//
//  LoginViewController.swift
//  FoodShare
//
//  Created by Alex Zhang on 2019-01-07.
//  Copyright © 2019 Alex Zhang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

//preemptively solved namespace conflict between Makestagram.User and FirebaseAuth.User by using type alias FIRUser
typealias FIRUser = FirebaseAuth.User

class  LoginViewController: UIViewController,FUIAuthDelegate{
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func LoginButtonTapped(_ sender: UIButton) {
        print("the login button is tapped!!!")
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let authViewController = authUI?.authViewController()
        present(authViewController!, animated: true) {
            print("FirebaseUI Presented!")
        }
        
    }
    
    //basic error handling
    //function that gets called after user login success or fail
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        print("============================================1sadfsdfsadfadsf")
        if(error != nil) {
            assertionFailure("Error signing in \(String(describing: error?.localizedDescription))")
        }else{
            print("Signup / Login successful!")
        }
        
        //get a FIRUser instance
        guard let user: FIRUser = authDataResult?.user
            else{
                return
        }
        UserService.show(forUID: user.uid) { user in
            if let user = user {
                //if snapshot return an existing user info, User init successfully and user != nil
                //call singlton to set user and also set user to system default
                User.setCurrent(user, writeToUserDefaults: true);
                print("Welcome back, \(user.username)")
                let newStoryBoard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = newStoryBoard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }else{
                //if there is no existing user info in snapshot
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
            
        }
    }
    
}
