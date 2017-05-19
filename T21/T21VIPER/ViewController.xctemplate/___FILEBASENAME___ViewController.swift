//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit

// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAMEASIDENTIFIER___EventHandler:class
{
    var viewModel : ___FILEBASENAMEASIDENTIFIER___ViewModel { get }
    func handleViewWillAppearEvent()
    func handleViewWillDisappearEvent()
}

// MARK: - ViewController Class must implement ViewModelHandler Protocol to handle ViewModel from Presenter
class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController, ___FILEBASENAMEASIDENTIFIER___ViewModelHandler
{
    //MARK: relationships
    var presenter: ___FILEBASENAMEASIDENTIFIER___EventHandler!
    
    var viewModel : ___FILEBASENAMEASIDENTIFIER___ViewModel {
        get {
            return presenter.viewModel
        }
    }
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
    }
    
    func configureBindings() {
        //Add the ViewModel bindings here ...
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewWillAppearEvent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.handleViewWillDisappearEvent()
    }
}
