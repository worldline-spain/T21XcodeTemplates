//
//  ___FILEBASENAME___ViewModel.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 05/07/2017.
//  Copyright (c) 2017 Worldline. All rights reserved.
//
//

import Foundation
import RxSwift

struct ___FILEBASENAME___ViewModel
{
    //data
    let userName = Variable<String?>("")
    let password = Variable<String?>("")
    
    //interactions
    let showUserNameError = Variable<Bool>(false)
    let showPasswordError = Variable<Bool>(false)
    let showLoadingFeedback = Variable<Bool>(false)
}
