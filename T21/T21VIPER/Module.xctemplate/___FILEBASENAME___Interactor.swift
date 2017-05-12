//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAMEASIDENTIFIER___ResponseHandler: class
{
    // func handle______Response()
}

// MARK: - Presenter Class must implement RequestHandler Protocol to handle Presenter Requests
class ___FILEBASENAMEASIDENTIFIER___Interactor: ___FILEBASENAMEASIDENTIFIER___RequestHandler
{
    //MARK: VIPER relationships
    weak var presenter : ___FILEBASENAMEASIDENTIFIER___ResponseHandler?
    
    
    //MARK: RequestHandler Protocol Implementation
    
    //func handle_____Request() {}

}
