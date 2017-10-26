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
    
    func loginViewDidPressLoginButton()
    func loginViewDidPressForgotPasswordButton()
    func loginViewDidPressRegisterButton()
}

// MARK: - Protocol to be defined at Presenter
protocol ___VARIABLE_productName:identifier___ResponseHandler: class
{
    func requestLoginDidStart()
    func requestLoginDidFinish(_ result: DoLoginEntity)
}

// MARK: - Presenter Class must implement Protocols to handle ViewController Events and Interactor Responses

class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___EventHandler, ___VARIABLE_productName:identifier___ResponseHandler {
    
    //MARK: Relationships
    weak var viewController: ___VARIABLE_productName:identifier___ViewUpdatesHandler?
    var interactor: ___VARIABLE_productName:identifier___RequestHandler!
    var wireframe: ___VARIABLE_productName:identifier___NavigationHandler!

    var viewModel = ___VARIABLE_productName:identifier___ViewModel()
    
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
