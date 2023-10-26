//
//  ExtensionAlert.swift
//  NewLogin
//
//  Created by Pranjal Tmarakar on 26/10/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func singleActionAlert(withTitle alertTitle: String,
                           withMessage alertMsg: String,
                           withButtonTitle buttonTitle: String,
                           withHandler handler: ((UIAlertAction) -> Void)? = nil,
                           withCompletion completion: (() -> Swift.Void)? = nil)
    {
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: handler))
        
        // show the alert
        if let navController = self.navigationController {
            navController.present(alert, animated: true, completion: completion)
        }
        else if let tabBarController = self.tabBarController {
            tabBarController.present(alert, animated: true, completion: completion)
        }
        else {
            
            let window = UIApplication.shared.windows.first
            window?.rootViewController?.present(alert, animated: true, completion: completion)
        }
    }
}
