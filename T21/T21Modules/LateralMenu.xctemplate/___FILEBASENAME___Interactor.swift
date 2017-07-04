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

protocol ___FILEBASENAME___RequestHandler:class
{
    func requestMenuItems() -> [___FILEBASENAME___ItemEntity]
}

class ___FILEBASENAME___Interactor: ___FILEBASENAME___RequestHandler
{
    //MARK: VIPER relationships
    weak var presenter : ___FILEBASENAME___ResponseHandler?
    
    //MARK: Interactor Interface
    
    func requestMenuItems() -> [___FILEBASENAME___ItemEntity] {
        return [___FILEBASENAME___HeaderItemEntity(.header, "Header title", "Header subtitle"),
                ___FILEBASENAME___SectionItemEntity(.home,"Home"),
                ___FILEBASENAME___SectionItemEntity(.search,"Search"),
                ___FILEBASENAME___SectionItemEntity(.settings,"Settings"),
                ___FILEBASENAME___SectionItemEntity(.help,"Help")]
    }
}
