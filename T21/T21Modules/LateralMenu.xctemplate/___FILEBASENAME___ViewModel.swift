//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

struct ___FILEBASENAME___ViewModel
{
    var menuItems : [___FILEBASENAME___CellViewModel] = []
}

class ___FILEBASENAME___CellViewModel
{
    var type : ___FILEBASENAME___ItemType = .home
}

class ___FILEBASENAME___ItemCellViewModel : ___FILEBASENAME___CellViewModel
{
    var title = ""
}

class ___FILEBASENAME___HeaderCellViewModel : ___FILEBASENAME___CellViewModel
{
    var title = ""
    var subtitle = ""
}
