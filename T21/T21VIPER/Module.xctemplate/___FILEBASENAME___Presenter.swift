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
protocol ___FILEBASENAMEASIDENTIFIER___RequestHandler:class
{
    // func handle______Request()
}
// MARK: - Protocol to be defined at ViewController
protocol ___FILEBASENAMEASIDENTIFIER___ViewModelHandler:class
{
    //That part should be implemented with RxSwift.
}
// MARK: - Protocol to be defined at Wireframe
protocol ___FILEBASENAMEASIDENTIFIER___NavigationHandler:class
{
    // Include methods to present or dismiss
}

// MARK: - Presenter Class must implement Protocols to handle ViewController Events and Interactor Responses
class ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___EventHandler, ___FILEBASENAMEASIDENTIFIER___ResponseHandler {
    
    //MARK: relationships
    weak var viewController : ___FILEBASENAMEASIDENTIFIER___ViewModelHandler?
    var interactor : ___FILEBASENAMEASIDENTIFIER___RequestHandler!
    var wireframe : ___FILEBASENAMEASIDENTIFIER___NavigationHandler!
    
    //MARK: EventsHandler Protocol Implementation
    func handleViewWillAppearEvent() {
        
    }
    
    func handleViewWillDisappearEvent() {
        
    }
    
    //MARK: ResponseHandler Protocol Implementation
    
    //func handle_____Response() {}
    
    
}
