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

protocol ___FILEBASENAMEASIDENTIFIER___ViewInterface : class
{
    //todo: add public methods from this view
}

protocol ___FILEBASENAMEASIDENTIFIER___ViewHandler
{
    //todo: add public events view handler (presenter) can receive.
    func viewWillAppear()
    func viewWillDisappear()
}

class ___FILEBASENAMEASIDENTIFIER___View: UIViewController, ___FILEBASENAMEASIDENTIFIER___ViewInterface, ___FILEBASENAMEASIDENTIFIER___ModuleRepresentation
{
    //MARK: VIPER relationships
    
    var presenter: ___FILEBASENAMEASIDENTIFIER___ViewHandler!
    
    //MARK: View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.viewWillDisappear()
    }
    
    //MARK: Module representation
    
    func asViewController() -> UIViewController { return self }
    
    //MARK: View Interface
    
    
    //MARK: View Handler
    

    //MARK: View Private
    
}
