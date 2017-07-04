//
//  ___FILEBASENAME___Interactor.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 04/07/2017.
//  Copyright (c) 2017 Worldline. All rights reserved.
//
//

import Foundation

// MARK: - Protocol to be defined at Interactor
protocol ___FILEBASENAME___RequestHandler:class
{
    // func requestSomething()
    // func requestUser(id:String)
}


// MARK: - Presenter Class must implement RequestHandler Protocol to handle Presenter Requests
class ___FILEBASENAME___Interactor: ___FILEBASENAME___RequestHandler
{
    //MARK: Relationships
    weak var presenter : ___FILEBASENAME___ResponseHandler?
    
    //MARK: RequestHandler Protocol
    //func requestSomething(){}
}

