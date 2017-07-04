//
//  ___FILEBASENAME___Presenter.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 04/07/2017.
//  Copyright (c) 2017 Worldline. All rights reserved.
//
//

import Foundation

// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAME___EventHandler:class
{
    var viewModel : ___FILEBASENAME___ViewModel { get }
    
    func handleViewWillAppear()
    func handleViewWillDisappear()
    func handleRetryButtonPressed()
}

// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAME___ResponseHandler: class
{
    // func somethingRequestWillStart()
    // func somethingRequestDidStart()
    // func somethingRequestWillProgress()
    // func somethingRequestDidProgress()
    // func somethingRequestWillFinish()
    // func somethingRequestDidFinish()
}

// MARK: - Presenter Class must implement Protocols to handle ViewController Events and Interactor Responses

class ___FILEBASENAME___Presenter: ___FILEBASENAME___EventHandler, ___FILEBASENAME___ResponseHandler {
    
    //MARK: relationships
    weak var viewController : ___FILEBASENAME___ViewUpdatesHandler?
    var interactor : ___FILEBASENAME___RequestHandler!
    var wireframe : ___FILEBASENAME___NavigationHandler!

    var viewModel = ___FILEBASENAME___ViewModel()
    
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
