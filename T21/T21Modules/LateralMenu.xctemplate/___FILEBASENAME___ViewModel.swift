//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

struct ___VARIABLE_productName:identifier___ViewModel
{
    var menuItems: [___VARIABLE_productName:identifier___CellViewModel] = []
}

class ___VARIABLE_productName:identifier___CellViewModel
{
    var type: ___VARIABLE_productName:identifier___ItemType = .home
}

class ___VARIABLE_productName:identifier___ItemCellViewModel: ___VARIABLE_productName:identifier___CellViewModel
{
    var title = ""
}

class ___VARIABLE_productName:identifier___HeaderCellViewModel: ___VARIABLE_productName:identifier___CellViewModel
{
    var title = ""
    var subtitle = ""
}
