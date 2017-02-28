//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

protocol ___FILEBASENAMEASIDENTIFIER___InteractorInterface
{
    //todo: add public request methods from this interactor
    func requestItems()
}

protocol ___FILEBASENAMEASIDENTIFIER___InteractorHandler : class
{
    //todo: add public responses for the interactor handler (presenter)
    func requestItemsDidStart()
    func requestItemsDidFinish( _ result: Array<String>)
}

class ___FILEBASENAMEASIDENTIFIER___Interactor: ___FILEBASENAMEASIDENTIFIER___InteractorInterface
{
    //MARK: VIPER relationships
    weak var presenter : ___FILEBASENAMEASIDENTIFIER___InteractorHandler!
    
    //MARK: Private vars
    
    private var isRequestingItems = false
    
    //MARK: Interactor Interface
    
    func requestItems() {
        //todo: modify the example code
        DispatchQueue.main.async {
            if !self.isRequestingItems {
                self.isRequestingItems = true
                self.presenter.requestItemsDidStart()
                DispatchQueue.main.async {
                    let result = ["Item 1","Item 2","Item 3","Item 4","Item 5"]
                    self.isRequestingItems = false
                    self.presenter.requestItemsDidFinish(result)
                }
            }
        }
    }
    
    //MARK: Interactor Private
    
    
}
