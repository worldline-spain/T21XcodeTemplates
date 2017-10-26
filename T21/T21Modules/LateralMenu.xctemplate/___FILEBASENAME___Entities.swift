//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

enum ___VARIABLE_productName:identifier___ItemType: String {
    case header
    case home
    case search
    case settings
    case help
}

class ___VARIABLE_productName:identifier___ItemEntity {
    let type: ___VARIABLE_productName:identifier___ItemType
    
    init( _ type: ___VARIABLE_productName:identifier___ItemType) {
        self.type = type
    }
}

class ___VARIABLE_productName:identifier___SectionItemEntity: ___VARIABLE_productName:identifier___ItemEntity {
    let title: String
    
    init( _ type: ___VARIABLE_productName:identifier___ItemType, _ title: String) {
        self.title = title
        super.init(type)
    }
}

class ___VARIABLE_productName:identifier___HeaderItemEntity: ___VARIABLE_productName:identifier___ItemEntity {
    let title: String
    let subtitle: String
    
    init( _ type: ___VARIABLE_productName:identifier___ItemType, _ title: String, _ subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        super.init(type)
    }
}
