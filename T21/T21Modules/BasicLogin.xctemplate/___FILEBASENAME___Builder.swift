//
//  ___FILEBASENAME___Builder.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 05/07/2017.
//  Copyright (c) 2017 Worldline. All rights reserved.
//
//

import Foundation
import UIKit


class ___FILEBASENAME___Builder
{
    static func build() -> UIViewController {
        let viewController = ___FILEBASENAME___ViewController(nibName:String.init(describing: ___FILEBASENAME___ViewController.self), bundle: nil)
        let presenter = ___FILEBASENAME___Presenter()
        let interactor = ___FILEBASENAME___Interactor()
        let wireframe = ___FILEBASENAME___Wireframe()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        wireframe.viewController = viewController
        
        _ = viewController.view //force loading the view to load the outlets
        return viewController
    }
}
