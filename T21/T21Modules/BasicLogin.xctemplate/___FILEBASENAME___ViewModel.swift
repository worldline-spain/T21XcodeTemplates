//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import RxSwift

struct ___VARIABLE_productName:identifier___ViewModel
{
    //data
    let userName = Variable<String?>("")
    let password = Variable<String?>("")
    
    //interactions
    let showUserNameError = Variable<Bool>(false)
    let showPasswordError = Variable<Bool>(false)
    let showLoadingFeedback = Variable<Bool>(false)
}
