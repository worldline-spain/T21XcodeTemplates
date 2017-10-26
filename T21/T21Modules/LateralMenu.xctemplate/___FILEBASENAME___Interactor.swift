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
    func requestMenuItems() -> [___VARIABLE_productName:identifier___ItemEntity]
}

class ___VARIABLE_productName:identifier___Interactor: ___VARIABLE_productName:identifier___RequestHandler
{
    //MARK: VIPER relationships
    weak var presenter: ___VARIABLE_productName:identifier___ResponseHandler?
    
    //MARK: Interactor Interface
    
    func requestMenuItems() -> [___VARIABLE_productName:identifier___ItemEntity] {
        return [___VARIABLE_productName:identifier___HeaderItemEntity(.header, "Header title", "Header subtitle"),
                ___VARIABLE_productName:identifier___SectionItemEntity(.home,"Home"),
                ___VARIABLE_productName:identifier___SectionItemEntity(.search,"Search"),
                ___VARIABLE_productName:identifier___SectionItemEntity(.settings,"Settings"),
                ___VARIABLE_productName:identifier___SectionItemEntity(.help,"Help")]
    }
}
