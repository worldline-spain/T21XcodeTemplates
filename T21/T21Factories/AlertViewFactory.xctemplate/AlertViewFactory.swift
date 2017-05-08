//
//  AlertViewFactory
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit

class AlertViewFactory {
    
    private init() {}
    
    static func showConnectionErrorAlertView( _ fromVC: UIViewController) {
        let alert = createAlertView("Connection error", "There is no Internet connection available.")
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        fromVC.present(alert, animated: true, completion: nil)
    }
    
    static func showInvalidCredentialsErrorAlertView( _ fromVC: UIViewController) {
        let alert = createAlertView("Incorrect credentials", "The introduced credentials are not valid.")
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        fromVC.present(alert, animated: true, completion: nil)
    }
    
    static func showIncorrectParametersErrorAlertView( _ fromVC: UIViewController, _ incorrectParameters: [String]) {
        let description = "The following fields are not valid: " + incorrectParameters.joined(separator: ", ") + "."
        let alert = createAlertView("Incorrect parameters", description)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        fromVC.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Private
    
    private static func createAlertView(_ title: String, _ message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        return alert
    }
}
