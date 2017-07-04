//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

enum ___FILEBASENAME___ItemType : String {
    case header
    case home
    case search
    case settings
    case help
}


class ___FILEBASENAME___ItemEntity {
    let type : ___FILEBASENAME___ItemType
    
    init( _ type : ___FILEBASENAME___ItemType) {
        self.type = type
    }
}

class ___FILEBASENAME___SectionItemEntity : ___FILEBASENAME___ItemEntity {
    let title : String
    
    init( _ type : ___FILEBASENAME___ItemType, _ title: String) {
        self.title = title
        super.init(type)
    }
}

class ___FILEBASENAME___HeaderItemEntity : ___FILEBASENAME___ItemEntity {
    let title : String
    let subtitle : String
    
    init( _ type : ___FILEBASENAME___ItemType, _ title: String, _ subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        super.init(type)
    }
}
