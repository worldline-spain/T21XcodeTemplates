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

protocol ___FILEBASENAME___EventHandler : class
{
    var viewModel : ___FILEBASENAME___ViewModel { get }
    func handleViewWillAppearEvent()
    func handleViewWillDisappearEvent()
}

protocol ___FILEBASENAME___ResponseHandler: class
{
    // func somethingRequestWillStart()
    // func somethingRequestDidStart()
    // func somethingRequestWillProgress()
    // func somethingRequestDidProgress()
    // func somethingRequestWillFinish()
    // func somethingRequestDidFinish()
}

class ___FILEBASENAME___Presenter: ___FILEBASENAME___EventHandler, ___FILEBASENAME___ResponseHandler, ___FILEBASENAME___HeaderEventHandler
{
    
    //MARK: VIPER relationships
    weak var viewController : ___FILEBASENAME___ViewUpdatesHandler?
    var interactor : ___FILEBASENAME___RequestHandler!
    var wireframe : ___FILEBASENAME___NavigationHandler!
    private(set) var viewModel = ___FILEBASENAME___ViewModel()

    
    //MARK: Private Vars
    
    var dataSource = TableViewDataSource<DataSourceItem>()
    private var wasShown = false

    //MARK: Initializers
    
    init() {
        
        dataSource.onTableViewDidSetFunction = { (tableView) in
            tableView?.rowHeight = UITableViewAutomaticDimension
            tableView?.estimatedRowHeight = 44
            
            tableView?.register(UINib.init(nibName: "___FILEBASENAME___ItemCell", bundle: nil), forCellReuseIdentifier: "item")
            tableView?.register(UINib.init(nibName: "___FILEBASENAME___HeaderCell", bundle: nil), forCellReuseIdentifier: "header")
        }
        
        dataSource.heightForRowFunction = { (tableView, indexPath, item) in
            return UITableViewAutomaticDimension
        }
        
        dataSource.cellForRowFunction = { [weak self] (tableView,indexPath,item) in
            let viewModel = item.value as! ___FILEBASENAME___CellViewModel
            if viewModel.type == .header {
                let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! ___FILEBASENAME___HeaderCell
                cell.selectionStyle = .none
                cell.viewModel = viewModel as! ___FILEBASENAME___HeaderCellViewModel
                cell.delegate = self
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "item") as! ___FILEBASENAME___ItemCell
                cell.viewModel = viewModel as! ___FILEBASENAME___ItemCellViewModel
                return cell
            }
        }
        
        dataSource.didSelectRowFunction = { [weak self] (tableView,indexPath,item) in
            let viewModel = item.value as! ___FILEBASENAME___CellViewModel
            if viewModel.type != .header {
                self?.wireframe.showMenuType(viewModel.type)
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    //MARK: View Handler
    
    func handleViewWillAppearEvent() {
        viewModel.menuItems = interactor.requestMenuItems().map { (element : ___FILEBASENAME___ItemEntity) -> ___FILEBASENAME___CellViewModel in
            if let row = element as? ___FILEBASENAME___SectionItemEntity {
                let vm = ___FILEBASENAME___ItemCellViewModel()
                vm.title = row.title
                vm.type = row.type
                return vm
            } else if let header = element as? ___FILEBASENAME___HeaderItemEntity {
                let vm = ___FILEBASENAME___HeaderCellViewModel()
                vm.title = header.title
                vm.subtitle = header.subtitle
                vm.type = header.type
                return vm
            }
            return ___FILEBASENAME___CellViewModel()
        }
        
        let items = viewModel.menuItems.enumerated().map { (index: Int, vm : ___FILEBASENAME___CellViewModel) -> DataSourceItem in
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
