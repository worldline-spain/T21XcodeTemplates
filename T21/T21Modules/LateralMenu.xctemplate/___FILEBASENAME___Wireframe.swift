//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit


// MARK: - Protocol to be defined at Wireframe

protocol ___VARIABLE_productName:identifier___NavigationHandler: class
{
    // Include methods to present or dismiss
    func showMenuType( _ type: ___VARIABLE_productName:identifier___ItemType)
}

// MARK: - Wireframe Class must implement NavigationHandler Protocol to handle Presenter Navigation requests
class ___VARIABLE_productName:identifier___Wireframe: ___VARIABLE_productName:identifier___NavigationHandler
{
    weak var viewController: ___VARIABLE_productName:identifier___View?
    
    func showMenuType( _ type: ___VARIABLE_productName:identifier___ItemType) {
        //todo: show the new screen using the specific type received
    }
}
