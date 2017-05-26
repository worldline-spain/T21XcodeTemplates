//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: - Protocol to be defined at Interactor
protocol ___FILEBASENAMEASIDENTIFIER___RequestHandler:class
{
    // func requestSomething()
    // func requestUser(id:String)
}


// MARK: - Presenter Class must implement RequestHandler Protocol to handle Presenter Requests
class ___FILEBASENAMEASIDENTIFIER___Interactor: ___FILEBASENAMEASIDENTIFIER___RequestHandler
{
    //MARK: Relationships
    weak var presenter : ___FILEBASENAMEASIDENTIFIER___ResponseHandler?
    
    //MARK: RequestHandler Protocol
    //func requestSomething(){}
}

