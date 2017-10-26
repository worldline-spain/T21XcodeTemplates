//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ___VARIABLE_productName:identifier___Builder
{
    static func build() -> UIViewController {
        let viewController = ___VARIABLE_productName:identifier___View(nibName: String(describing: ___VARIABLE_productName:identifier___View.self), bundle: nil)
        let presenter = ___VARIABLE_productName:identifier___Presenter()
        let interactor = ___VARIABLE_productName:identifier___Interactor()
        let wireframe = ___VARIABLE_productName:identifier___Wireframe()
        
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
