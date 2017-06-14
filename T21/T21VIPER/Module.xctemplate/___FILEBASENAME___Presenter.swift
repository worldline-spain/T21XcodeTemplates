//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAMEASIDENTIFIER___EventHandler:class
{
    var viewModel : ___FILEBASENAMEASIDENTIFIER___ViewModel { get }
    
    func handleViewWillAppear()
    func handleViewWillDisappear()
}

// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAMEASIDENTIFIER___ResponseHandler: class
{
    // func somethingRequestWillStart()
    // func somethingRequestDidStart()
    // func somethingRequestWillProgress()
    // func somethingRequestDidProgress()
    // func somethingRequestWillFinish()
    // func somethingRequestDidFinish()
}

// MARK: - Presenter Class must implement Protocols to handle ViewController Events and Interactor Responses

class ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___EventHandler, ___FILEBASENAMEASIDENTIFIER___ResponseHandler {
    
    //MARK: Relationships
    weak var viewController : ___FILEBASENAMEASIDENTIFIER___ViewUpdatesHandler?
    var interactor : ___FILEBASENAMEASIDENTIFIER___RequestHandler!
    var wireframe : ___FILEBASENAMEASIDENTIFIER___NavigationHandler!

    var viewModel = ___FILEBASENAMEASIDENTIFIER___ViewModel()
    
    //MARK: - EventsHandler Protocol
    func handleViewWillAppear() {
        //TODO:
    }
    
    func handleViewWillDisappear() {
        //TODO:
    }
    
    //MARK: - ResponseHandler Protocol
    
    // func somethingRequestWillStart(){}
    // func somethingRequestDidStart(){}
    // func somethingRequestWillProgress(){}
    // func somethingRequestDidProgress(){}
    // func somethingRequestWillFinish(){}
    // func somethingRequestDidFinish(){}

}
