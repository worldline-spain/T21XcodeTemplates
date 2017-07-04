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

protocol ___FILEBASENAME___NavigationHandler:class
{
    // Include methods to present or dismiss
    func showMenuType( _ type: ___FILEBASENAME___ItemType)
}

// MARK: - Wireframe Class must implement NavigationHandler Protocol to handle Presenter Navigation requests
class ___FILEBASENAME___Wireframe: ___FILEBASENAME___NavigationHandler
{
    weak var viewController : ___FILEBASENAME___View?
    
    func showMenuType( _ type: ___FILEBASENAME___ItemType) {
        //todo: show the new screen using the specific type received
    }
}
