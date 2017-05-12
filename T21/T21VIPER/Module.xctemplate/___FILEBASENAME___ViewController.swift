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
    func handleViewWillAppearEvent()
    func handleViewWillDisappearEvent()
}

// MARK: - ViewController Class must implement ViewModelsHandler Protocol to handle ViewModel from Presenter
class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController, ___FILEBASENAMEASIDENTIFIER___ViewModelHandler
{
    //MARK: relationships
    var presenter: ___FILEBASENAMEASIDENTIFIER___EventHandler!
    
    
    //MARK: View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewWillAppearEvent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.handleViewWillDisappearEvent()
    }
}
