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
protocol ___VARIABLE_productName:identifier___EventHandler: class
{
    var viewModel: ___VARIABLE_productName:identifier___ViewModel { get }
    
    func handleViewWillAppear()
    func handleViewWillDisappear()
    func handleRetryButtonPressed()
}

// MARK: - Protocol to be defined at Presenter
protocol ___VARIABLE_productName:identifier___ResponseHandler: class
{
    // func somethingRequestWillStart()
    // func somethingRequestDidStart()
    // func somethingRequestWillProgress()
    // func somethingRequestDidProgress()
    // func somethingRequestWillFinish()
    // func somethingRequestDidFinish()
}

// MARK: - Presenter Class must implement Protocols to handle ViewController Events and Interactor Responses

class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___EventHandler, ___VARIABLE_productName:identifier___ResponseHandler {
    
    //MARK: relationships
    weak var viewController: ___VARIABLE_productName:identifier___ViewUpdatesHandler?
    var interactor: ___VARIABLE_productName:identifier___RequestHandler!
    var wireframe: ___VARIABLE_productName:identifier___NavigationHandler!

    var viewModel = ___VARIABLE_productName:identifier___ViewModel()
    
    //MARK: EventsHandler Protocol
    func handleViewWillAppear() {
        //TODO:
    }
    
    func handleViewWillDisappear() {
        //TODO:
    }
    
    func handleRetryButtonPressed() {
        //TODO:
    }
    
    //MARK: ResponseHandler Protocol
    
    // func somethingRequestWillStart(){}
    // func somethingRequestDidStart(){}
    // func somethingRequestWillProgress(){}
    // func somethingRequestDidProgress(){}
    // func somethingRequestWillFinish(){}
    // func somethingRequestDidFinish(){}

}
