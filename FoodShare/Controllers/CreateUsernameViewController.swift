//
//  CreateUsernameViewController.swift
//  FoodShare
//
//  Created by Alex Zhang on 2019-01-13.
//  Copyright © 2019 Alex Zhang. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

import UIKit

class CreateUsernameViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        // 1
        
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        //create an user(upload user info) to Firebase
        UserService.create(firUser, username: username) { user in
            guard let user = user else {return}
            print("created new user \(user.username)")
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
        
    }
    
    
}
