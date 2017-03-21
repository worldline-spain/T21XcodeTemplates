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

protocol ___FILEBASENAMEASIDENTIFIER___ViewInterface : class
{
    //todo: add public methods from this view
    func animatePullToRefresh( _ show: Bool)
}

protocol ___FILEBASENAMEASIDENTIFIER___ViewHandler
{
    //todo: add public events view handler (presenter) can receive.
    func viewWillAppear()
    func viewWillDisappear()
    func viewDidPullToRefresh()
}

class ___FILEBASENAMEASIDENTIFIER___View: UIViewController, ___FILEBASENAMEASIDENTIFIER___ViewInterface, ___FILEBASENAMEASIDENTIFIER___ModuleRepresentation
{
    //MARK: VIPER relationships
    
    var presenter: ___FILEBASENAMEASIDENTIFIER___ViewHandler!
    
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
        presenter.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
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
