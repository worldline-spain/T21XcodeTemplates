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

// MARK: - Protocol to be defined at ViewController

protocol ___FILEBASENAME___ViewUpdatesHandler:class
{
    
}

class ___FILEBASENAME___View: UIViewController, ___FILEBASENAME___ViewUpdatesHandler
{
    //MARK: VIPER relationships
    
    var presenter: ___FILEBASENAME___EventHandler!
    
    var viewModel : ___FILEBASENAME___ViewModel {
        return presenter.viewModel
    }
    
    //MARK: View Outlets
    
    @IBOutlet
    weak var tableView: UITableView?
    
    //MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
        
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: 100, height: 1)
        footerView.backgroundColor = UIColor.clear
        tableView?.tableFooterView = footerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewWillAppearEvent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.handleViewWillDisappearEvent()
    }

    //MARK: View Private
    
    func configureBindings() {
        //Add the ViewModel bindings here ...
    }
    
}
