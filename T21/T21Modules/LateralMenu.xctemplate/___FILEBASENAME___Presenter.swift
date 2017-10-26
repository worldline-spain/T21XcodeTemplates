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
}

protocol ___VARIABLE_productName:identifier___ResponseHandler: class
{
    // func somethingRequestWillStart()
    // func somethingRequestDidStart()
    // func somethingRequestWillProgress()
    // func somethingRequestDidProgress()
    // func somethingRequestWillFinish()
    // func somethingRequestDidFinish()
}

class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___EventHandler, ___VARIABLE_productName:identifier___ResponseHandler, ___VARIABLE_productName:identifier___HeaderEventHandler
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
            
            tableView?.register(UINib.init(nibName: "___VARIABLE_productName:identifier___ItemCell", bundle: nil), forCellReuseIdentifier: "item")
            tableView?.register(UINib.init(nibName: "___VARIABLE_productName:identifier___HeaderCell", bundle: nil), forCellReuseIdentifier: "header")
        }
        
        dataSource.heightForRowFunction = { (tableView, indexPath, item) in
            return UITableViewAutomaticDimension
        }
        
        dataSource.cellForRowFunction = { [weak self] (tableView,indexPath,item) in
            let viewModel = item.value as! ___VARIABLE_productName:identifier___CellViewModel
            if viewModel.type == .header {
                let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! ___VARIABLE_productName:identifier___HeaderCell
                cell.selectionStyle = .none
                cell.viewModel = viewModel as! ___VARIABLE_productName:identifier___HeaderCellViewModel
                cell.delegate = self
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "item") as! ___VARIABLE_productName:identifier___ItemCell
                cell.viewModel = viewModel as! ___VARIABLE_productName:identifier___ItemCellViewModel
                return cell
            }
        }
        
        dataSource.didSelectRowFunction = { [weak self] (tableView,indexPath,item) in
            let viewModel = item.value as! ___VARIABLE_productName:identifier___CellViewModel
            if viewModel.type != .header {
                self?.wireframe.showMenuType(viewModel.type)
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    //MARK: View Handler
    
    func handleViewWillAppearEvent() {
        viewModel.menuItems = interactor.requestMenuItems().map { (element: ___VARIABLE_productName:identifier___ItemEntity) -> ___VARIABLE_productName:identifier___CellViewModel in
            if let row = element as? ___VARIABLE_productName:identifier___SectionItemEntity {
                let vm = ___VARIABLE_productName:identifier___ItemCellViewModel()
                vm.title = row.title
                vm.type = row.type
                return vm
            } else if let header = element as? ___VARIABLE_productName:identifier___HeaderItemEntity {
                let vm = ___VARIABLE_productName:identifier___HeaderCellViewModel()
                vm.title = header.title
                vm.subtitle = header.subtitle
                vm.type = header.type
                return vm
            }
            return ___VARIABLE_productName:identifier___CellViewModel()
        }
        
        let items = viewModel.menuItems.enumerated().map { (index: Int, vm: ___VARIABLE_productName:identifier___CellViewModel) -> DataSourceItem in
            return DataSourceItem(vm, vm.type.rawValue, Float(index))
        }
        
        dataSource.addItems(items)
    }
    
    func handleViewWillDisappearEvent() {
        //todo:
    }
    
    //MARK: Header Event Handler
    
    func headerButtonPressed() {
        //todo: implement an action
    }
}
