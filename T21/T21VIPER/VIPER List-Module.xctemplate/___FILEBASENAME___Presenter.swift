//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import T21TableViewDataSource //pod 'T21TableViewDataSource'

// MARK: - Protocol to be defined at Interactor

protocol ___FILEBASENAMEASIDENTIFIER___RequestHandler:class
{
    func requestItems()
}

// MARK: - Protocol to be defined at ViewController

protocol ___FILEBASENAMEASIDENTIFIER___ViewModelHandler:class
{
    //That part should be implemented with RxSwift.
    func animatePullToRefresh( _ show: Bool)
}

// MARK: - Protocol to be defined at Wireframe

protocol ___FILEBASENAMEASIDENTIFIER___NavigationHandler:class
{
    // Include methods to present or dismiss
}

class ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___EventHandler, ___FILEBASENAMEASIDENTIFIER___ResponseHandler
{
    
    //MARK: VIPER relationships
    weak var viewController : ___FILEBASENAMEASIDENTIFIER___ViewModelHandler?
    var interactor : ___FILEBASENAMEASIDENTIFIER___RequestHandler!
    var wireframe : ___FILEBASENAMEASIDENTIFIER___NavigationHandler!
    let viewModel = ___FILEBASENAMEASIDENTIFIER___ViewModel()

    
    //MARK: Private Vars
    
    var dataSource = TableViewDataSource<DataSourceItem>()
    private var wasShown = false

    //MARK: Initializers
    
    init() {
        dataSource.cellForRowFunction = {(tableView,indexPath,item) in
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            let viewModel = item.value as! ___FILEBASENAMEASIDENTIFIER___ViewModel
            cell.textLabel?.text = viewModel.title
            return cell
        }
        
        dataSource.didSelectRowFunction = { [weak self] (tableView,indexPath,item) in
            let viewModel = item.value as! ___FILEBASENAMEASIDENTIFIER___ViewModel
            //self?.wireframe?.pushItemDetailView()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    //MARK: View Handler
    
    func handleViewWillAppearEvent() {
        //todo: modify the example
        if !wasShown {
            wasShown = true
            self.interactor.requestItems()
        }
    }
    
    func handleViewWillDisappearEvent() {
        //todo:
    }
    
    func viewDidPullToRefresh() {
        self.interactor.requestItems()
    }
    
    //MARK: Interactor Handler
    
    func itemsRequestStarts() {
        //todo: show loading feedback
        self.viewController?.animatePullToRefresh(true)
    }
    
    func itemsRequestFinishes( _ result: Array<String>) {
        //todo: modify the example
        
        //map entities to view models
        let viewModels = mapEntitiesToViewModels(result)
        
        //add the view models creating DataSourceItems
        let rows = viewModels.map { (viewModel) -> DataSourceItem in
            return DataSourceItem(viewModel, viewModel.title)
        }
        self.dataSource.addItems(rows)
        self.viewController?.animatePullToRefresh(false)
    }
    
    //MARK: Private
    
    private func mapEntitiesToViewModels( _ items: Array<String>) -> Array<___FILEBASENAMEASIDENTIFIER___ViewModel> {
        return items.map({ (entity) -> ___FILEBASENAMEASIDENTIFIER___ViewModel in
            var vm = ___FILEBASENAMEASIDENTIFIER___ViewModel()
            vm.title = "View Model: \(entity)"
            return vm
        })
    }

}
