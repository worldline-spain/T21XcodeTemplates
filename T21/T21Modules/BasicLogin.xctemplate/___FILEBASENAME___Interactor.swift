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
protocol ___VARIABLE_productName:identifier___RequestHandler: class
{
    func requestLogin(_ userName: String,_ password: String)
}

// MARK: - Presenter Class must implement RequestHandler Protocol to handle Presenter Requests
class ___VARIABLE_productName:identifier___Interactor: ___FILEBASENAME___RequestHandler
{
    //MARK: Relationships
    weak var presenter: ___VARIABLE_productName:identifier___ResponseHandler?
    
    //MARK: - RequestHandler Protocol
    
    func requestLogin(_ userName: String,_ password: String) {
        
        presenter?.requestLoginDidStart()
        //todo: make login request
        //todo: manage login response success and error
        presenter?.requestLoginDidFinish(DoLoginEntity.success)
    }
}

