//
//  MGPhotoHelper.swift
//  FoodShare
//
//  Created by Alex Zhang on 2019-01-23.
//  Copyright © 2019 Alex Zhang. All rights reserved.
//

import UIKit

class MGPhotoHelper: NSObject {
    // MARK: - Properties
    
    var completionHandler: ((UIImage) -> Void)?
    
    // MARK: - Helper Methods
    
    func presentActionSheet(from viewController: UIViewController) {
        // 1 Initialize a new UIAlertController of type actionSheet. UIAlertController can be used to present different types of alerts. An action sheet is a popup that will be displayed at the bottom edge of the screen.
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        
        // 2
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // 3
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { action in
                // do nothing yet...
            })
            
            // 4
            alertController.addAction(capturePhotoAction)
        }
        
        // 5
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
                // do nothing yet...
            })
            
            alertController.addAction(uploadAction)
        }
        
        // 6
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Present the UIAlertController from our UIViewController. Remember, we must pass in a reference from the view controller presenting the alert controller for this method to properly present the UIAlertController.
        viewController.present(alertController, animated: true)
    }
}
