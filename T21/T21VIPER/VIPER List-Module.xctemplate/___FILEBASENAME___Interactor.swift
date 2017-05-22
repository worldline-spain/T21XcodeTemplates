//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

protocol ___FILEBASENAMEASIDENTIFIER___ResponseHandler : class
{
    func itemsRequestStarts()
    func itemsRequestFinishes( _ result: Array<String>)
}

class ___FILEBASENAMEASIDENTIFIER___Interactor: ___FILEBASENAMEASIDENTIFIER___RequestHandler
{
    //MARK: VIPER relationships
    weak var presenter : ___FILEBASENAMEASIDENTIFIER___ResponseHandler?
    
    //MARK: Private vars
    
    private var isRequestingItems = false
    
    //MARK: Interactor Interface
    
    func requestItems() {
        //todo: modify the example code
        DispatchQueue.main.async {
            if !self.isRequestingItems {
                self.isRequestingItems = true
                self.presenter?.itemsRequestStarts()
                DispatchQueue.main.async {
                    let result = ["Entity 1","Entity 2","Entity 3","Entity 4","Entity 5"]
                    self.isRequestingItems = false
                    self.presenter?.itemsRequestFinishes(result)
                }
            }
        }
    }
    
    //MARK: Interactor Private
    
    
}
