//
//  ___FILEBASENAME___Interactor.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 05/07/2017.
//  Copyright (c) 2017 Worldline. All rights reserved.
//
//

import Foundation

// MARK: - Protocol to be defined at Interactor
protocol ___FILEBASENAME___RequestHandler:class
{
    func requestLogin(_ userName: String,_ password: String)
}


// MARK: - Presenter Class must implement RequestHandler Protocol to handle Presenter Requests
class ___FILEBASENAME___Interactor: ___FILEBASENAME___RequestHandler
{
    //MARK: Relationships
    weak var presenter : ___FILEBASENAME___ResponseHandler?
    
    //MARK: - RequestHandler Protocol
    
    func requestLogin(_ userName: String,_ password: String) {
        
        presenter?.requestLoginDidStart()
        //todo: make login request
        //todo: manage login response success and error
        presenter?.requestLoginDidFinish(DoLoginEntity.success)
    }
}

