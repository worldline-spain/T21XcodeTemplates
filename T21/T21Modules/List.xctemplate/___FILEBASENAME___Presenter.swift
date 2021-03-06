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

// MARK: - Protocols to be defined at Presenter
protocol ___VARIABLE_productName:identifier___EventHandler: class
{
    var viewModel: ___VARIABLE_productName:identifier___ViewModel { get }
    func handleViewWillAppearEvent()
    func handleViewWillDisappearEvent()
    func viewDidPullToRefresh()
}

protocol ___VARIABLE_productName:identifier___ResponseHandler: class
{
    // func somethingRequestWillStart()
    // func somethingRequestDidStart()
    // func somethingRequestWillProgress()
    // func somethingRequestDidProgress()
    // func somethingRequestWillFinish()
    // func somethingRequestDidFinish()
    
    func itemsRequestDidStart()
    func itemsRequestDidFinish( _ result: Array<String>)
}

class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___EventHandler, ___VARIABLE_productName:identifier___ResponseHandler
{
    
    //MARK: VIPER relationships
    weak var viewController: ___VARIABLE_productName:identifier___ViewUpdatesHandler?
    var interactor: ___VARIABLE_productName:identifier___RequestHandler!
    var wireframe: ___VARIABLE_productName:identifier___NavigationHandler!
    private(set) var viewModel = ___VARIABLE_productName:identifier___ViewModel()

    //MARK: Private Vars
    var dataSource = TableViewDataSource<DataSourceItem>()
    private var wasShown = false

    //MARK: Initializers
    
    init() {
        
        dataSource.onTableViewDidSetFunction = { (tableView) in
            tableView?.rowHeight = UITableViewAutomaticDimension
            tableView?.estimatedRowHeight = 44
            
            //tableView?.register(UINib.init(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCellIdentifier")
        }
        
        dataSource.heightForRowFunction = { (tableView, indexPath, item) in
            return UITableViewAutomaticDimension
        }
        
        dataSource.cellForRowFunction = {(tableView,indexPath,item) in
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            let viewModel = item.value as! ___VARIABLE_productName:identifier___CellViewModel
            cell.textLabel?.text = viewModel.title
            return cell
        }
        
        dataSource.didSelectRowFunction = { [weak self] (tableView,indexPath,item) in
            let viewModel = item.value as! ___VARIABLE_productName:identifier___CellViewModel
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
    
    func itemsRequestDidStart() {
        //todo: show loading feedback
        self.viewController?.animatePullToRefresh(true)
    }
    
    func itemsRequestDidFinish( _ result: Array<String>) {
        //todo: modify the example
        
        //map entities to view models
        viewModel.items = mapEntitiesToViewModels(result)
        
        //add the view models creating DataSourceItems
        let rows = viewModel.items.map { (viewModel) -> DataSourceItem in
            return DataSourceItem(viewModel, viewModel.title)
        }
        self.dataSource.addItems(rows)
        self.viewController?.animatePullToRefresh(false)
    }
    
    //MARK: Private
    
    private func mapEntitiesToViewModels( _ items: Array<String>) -> Array<___VARIABLE_productName:identifier___CellViewModel> {
        return items.map({ (entity) -> ___VARIABLE_productName:identifier___CellViewModel in
            var vm = ___VARIABLE_productName:identifier___CellViewModel()
            vm.title = "View Model: \(entity)"
            return vm
        })
    }

}
