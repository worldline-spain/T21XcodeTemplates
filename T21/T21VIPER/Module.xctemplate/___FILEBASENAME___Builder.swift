//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit


class ___FILEBASENAMEASIDENTIFIER___Builder
{
    static func build() -> UIViewController {
        let viewController = ___FILEBASENAMEASIDENTIFIER___ViewController(nibName: "___FILEBASENAMEASIDENTIFIER___ViewController", bundle: nil)
        let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter()
        let interactor = ___FILEBASENAMEASIDENTIFIER___Interactor()
        let wireframe = ___FILEBASENAMEASIDENTIFIER___Wireframe()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        wireframe.viewController = viewController
        
        _ = viewController.view //force loading the view to load the outlets
        return viewController
    }
}
