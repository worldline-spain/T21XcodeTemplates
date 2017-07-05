//
//  ___FILEBASENAME___Presenter.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 05/07/2017.
//  Copyright (c) 2017 Worldline. All rights reserved.
//
//

import Foundation

// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAME___EventHandler:class
{
    var viewModel : ___FILEBASENAME___ViewModel { get }
    
    func loginViewDidPressLoginButton()
    func loginViewDidPressForgotPasswordButton()
    func loginViewDidPressRegisterButton()
}

// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAME___ResponseHandler: class
{
    func requestLoginDidStart()
    func requestLoginDidFinish(_ result: DoLoginEntity)
}

// MARK: - Presenter Class must implement Protocols to handle ViewController Events and Interactor Responses

class ___FILEBASENAME___Presenter: ___FILEBASENAME___EventHandler, ___FILEBASENAME___ResponseHandler {
    
    //MARK: Relationships
    weak var viewController : ___FILEBASENAME___ViewUpdatesHandler?
    var interactor : ___FILEBASENAME___RequestHandler!
    var wireframe : ___FILEBASENAME___NavigationHandler!

    var viewModel = ___FILEBASENAME___ViewModel()
    

    //MARK: LoginViewHandler callbacks
    
    func loginViewDidPressLoginButton() {
        removeErrors()
        let userName = viewModel.userName.value ?? ""
        let password = viewModel.password.value ?? ""
        
        if !userName.isEmpty && !password.isEmpty {
            self.interactor.requestLogin(userName, password)
        } else {
            viewModel.showUserNameError.value = userName.isEmpty
            viewModel.showPasswordError.value = password.isEmpty
        }
    }
    
    func loginViewDidPressForgotPasswordButton() {
        //TODO:
    }
    
    func loginViewDidPressRegisterButton() {
        //TODO:
    }
    
    
    //MARK: - ResponseHandler Protocol
    
    func requestLoginDidStart() {
        viewModel.showLoadingFeedback.value = true
    }
    
    func requestLoginDidFinish(_ result: DoLoginEntity) {
        
        switch result {
        case .success:
            viewModel.showLoadingFeedback.value = false
            //todo: perform action when the login was successful
            break
        case .connectionError:
            self.viewController?.hideFeedbackLoadingError("Connection error")
            break
            
        case .invalidCredentials:
            self.viewController?.hideFeedbackLoadingError("Invalid credentials")
            break
        }
    }
    
    //MARK: Private
    
    func removeErrors() {
        viewModel.showUserNameError.value = false
        viewModel.showPasswordError.value = false
    }
}
