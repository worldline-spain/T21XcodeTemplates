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

protocol ___FILEBASENAMEASIDENTIFIER___ModuleRepresentation : class
{
    func asViewController() -> UIViewController
}

class ___FILEBASENAMEASIDENTIFIER___Builder
{
    static func create() -> ___FILEBASENAMEASIDENTIFIER___ModuleRepresentation {
        let vc = ___FILEBASENAMEASIDENTIFIER___View(nibName: "___FILEBASENAMEASIDENTIFIER___View", bundle: nil)
        let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter()
        let interactor = ___FILEBASENAMEASIDENTIFIER___Interactor()
        let wireframe = ___FILEBASENAMEASIDENTIFIER___Wireframe()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        wireframe.module = vc
        
        _ = vc.view //force loading the view to load the outlets
        presenter.dataSource.tableView = vc.tableView
        
        return vc
    }
    
}
