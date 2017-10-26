//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: - Protocol to be defined at ViewController
protocol ___VARIABLE_productName:identifier___ViewUpdatesHandler: class
{
    //That part should be implemented with RxSwift.
    //func updateSomeView()
}

// MARK: - ViewController Class must implement ViewModelHandler Protocol to handle ViewModel from Presenter
class ___VARIABLE_productName:identifier___ViewController: UIViewController, ___VARIABLE_productName:identifier___ViewUpdatesHandler
{
    //MARK: Relationships
    var presenter: ___VARIABLE_productName:identifier___EventHandler!
    
    var viewModel: ___VARIABLE_productName:identifier___ViewModel {
        return presenter.viewModel
    }
    
    //MARK: - IBOutlets
    
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
        configureOutlets()
    }
    
    func configureBindings() {
        //Add the ViewModel bindings here ...
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.handleViewWillDisappear()
    }
    
    //MARK: - UI Configuration
    
    private func configureOutlets() {
        
    }
    
    //MARK: - ___VARIABLE_productName:identifier___ViewUpdatesHandler
    
    
    
    //MARK: - Private methods
    
    
    
}
