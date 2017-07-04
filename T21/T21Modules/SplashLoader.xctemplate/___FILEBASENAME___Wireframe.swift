//
//  ___FILEBASENAME___Wireframe.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 04/07/2017.
//  Copyright (c) 2017 Worldline. All rights reserved.
//
//

import UIKit

// MARK: - Protocol to be defined at Wireframe
protocol ___FILEBASENAME___NavigationHandler:class
{
    // Include methods to present or dismiss
}

// MARK: - Wireframe Class must implement NavigationHandler Protocol to handle Presenter Navigation calls
class ___FILEBASENAME___Wireframe: ___FILEBASENAME___NavigationHandler
{
    weak var viewController : ___FILEBASENAME___ViewController?
}
