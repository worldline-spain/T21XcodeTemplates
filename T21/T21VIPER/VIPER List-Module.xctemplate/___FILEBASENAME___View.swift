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
import T21PullToRefreshController // pod 'T21PullToRefreshController'

protocol ___FILEBASENAMEASIDENTIFIER___EventHandler : class
{
    var viewModel : ___FILEBASENAMEASIDENTIFIER___ViewModel { get }
    func handleViewWillAppearEvent()
    func handleViewWillDisappearEvent()
    func viewDidPullToRefresh()
}

class ___FILEBASENAMEASIDENTIFIER___View: UIViewController, ___FILEBASENAMEASIDENTIFIER___ViewModelHandler
{
    //MARK: VIPER relationships
    
    var presenter: ___FILEBASENAMEASIDENTIFIER___EventHandler!
    
    //MARK: View Outlets
    
    @IBOutlet
    weak var tableView: UITableView?
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.tableView?.addPullToRefresh(refreshBlock: { () in
            self.presenter.viewDidPullToRefresh()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewWillAppearEvent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.handleViewWillDisappearEvent()
    }
    
    //MARK: Module representation
    
    func asViewController() -> UIViewController { return self }
    
    //MARK: View Interface
    
    func animatePullToRefresh( _ show: Bool) {
        if show {
            self.tableView?.startPullToRefreshAnimation()
        } else {
            self.tableView?.finishPullToRefreshAnimation()
        }
    }
    

    //MARK: View Private
    
}
