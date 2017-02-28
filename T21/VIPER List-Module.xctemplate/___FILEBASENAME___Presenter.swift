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

class ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___ViewHandler, ___FILEBASENAMEASIDENTIFIER___InteractorHandler
{
    
    //MARK: VIPER relationships
    weak var view : ___FILEBASENAMEASIDENTIFIER___ViewInterface!
    var interactor : ___FILEBASENAMEASIDENTIFIER___InteractorInterface!
    var wireframe : ___FILEBASENAMEASIDENTIFIER___Wireframe!
    
    //MARK: Private Vars
    
    var dataSource = TableViewDataSource<DataSourceItem>()
    private var wasShown = false

    //MARK: Initializers
    
    init() {
        dataSource.cellForRowFunction = {(tableView,indexPath,item) in
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "c")
            let viewModel = item.value as! String
            cell.textLabel?.text = viewModel
            return cell
        }
        
        dataSource.didSelectRowFunction = { [weak self] (tableView,indexPath,item) in
            if let strongSelf = self {
                let viewModel = item.value as! String
                //strongSelf.wireframe?.pushItemDetailView(viewModel)
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    
    //MARK: View Handler
    
    func viewWillAppear() {
        //todo: modify the example
        if !wasShown {
            wasShown = true
            self.interactor.requestItems()
        }
    }
    
    func viewWillDisappear() {
        //todo:
    }
    
    func viewDidPullToRefresh() {
        self.interactor.requestItems()
    }
    
    //MARK: Interactor Handler
    
    func requestItemsDidStart() {
        //todo: show loading feedback
        self.view.animatePullToRefresh(true)
    }
    
    func requestItemsDidFinish( _ result: Array<String>) {
        //todo: modify the example
        
        //map entities to view models
        let viewModels = mapEntitiesToViewModels(result)
        
        //add the view models creating DataSourceItems
        let rows = viewModels.map { (viewModel) -> DataSourceItem in
            return DataSourceItem(viewModel, viewModel)
        }
        self.dataSource.addItems(rows)
        self.view.animatePullToRefresh(false)
    }
    
    //MARK: Private
    
    private func mapEntitiesToViewModels( _ items: Array<String>) -> Array<String> {
        return items.map({ (item) -> String in
            return "View Model: \(item)"
        })
    }

}
