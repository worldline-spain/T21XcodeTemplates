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


class ___FILEBASENAME___Builder
{
    static func build() -> UIViewController {
        let viewController = ___FILEBASENAME___View(nibName: String(describing: ___FILEBASENAME___View.self), bundle: nil)
        let presenter = ___FILEBASENAME___Presenter()
        let interactor = ___FILEBASENAME___Interactor()
        let wireframe = ___FILEBASENAME___Wireframe()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        wireframe.viewController = viewController
        
        _ = viewController.view //force loading the view to load the outlets
        presenter.dataSource.tableView = viewController.tableView // link the dataSource object with the tableView

        return viewController
    }
}
