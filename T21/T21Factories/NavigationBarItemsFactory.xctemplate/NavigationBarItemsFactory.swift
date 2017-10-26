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

@objc
protocol NavigationBarBackButtonItemProtocol : class {
    @objc
    func navigationBarBackButtonPressed()
}

@objc
protocol NavigationBarFilterButtonItemProtocol : class {
    @objc
    func navigationBarFilterButtonPressed()
}

@objc
protocol NavigationBarSearchButtonItemProtocol : class {
    @objc
    func navigationBarSearchButtonPressed()
}

@objc
protocol NavigationBarSettingsButtonItemProtocol : class {
    @objc
    func navigationBarSettingsButtonPressed()
}

@objc
protocol NavigationBarLoginButtonItemProtocol : class {
    @objc
    func navigationBarLoginButtonPressed()
}

@objc
protocol NavigationBarCancelButtonItemProtocol : class {
    @objc
    func navigationBarCancelButtonPressed()
}

class NavigationBarItemsFactory {
    
    static public func createBackButtonItem(_ delegate: NavigationBarBackButtonItemProtocol) -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "title_todo", style: UIBarButtonItemStyle.plain, target: delegate, action: #selector(NavigationBarBackButtonItemProtocol.navigationBarBackButtonPressed))
        return button
    }
    
    static public func createFilterButtonItem(_ delegate: NavigationBarFilterButtonItemProtocol) -> UIBarButtonItem {
        
        let image = UIImage(named: "image_todo")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let button = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: delegate, action: #selector(NavigationBarFilterButtonItemProtocol.navigationBarFilterButtonPressed))
        return button
    }
    
    static public func createSearchButtonItem(_ delegate: NavigationBarSearchButtonItemProtocol) -> UIBarButtonItem {
        let image = UIImage(named: "image_todo")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let button = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: delegate, action: #selector(NavigationBarSearchButtonItemProtocol.navigationBarSearchButtonPressed))
        return button
    }
    
    static public func createLoginButtonItem(_ delegate: NavigationBarLoginButtonItemProtocol) -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "title_todo", style: UIBarButtonItemStyle.plain, target: delegate, action: #selector(NavigationBarLoginButtonItemProtocol.navigationBarLoginButtonPressed))
        return button
    }
    
    static public func createCancelButtonItem(_ delegate: NavigationBarCancelButtonItemProtocol) -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "title_todo", style: UIBarButtonItemStyle.plain, target: delegate, action: #selector(NavigationBarCancelButtonItemProtocol.navigationBarCancelButtonPressed))
        return button
    }
    
    static public func createSettingsButtonItem(_ delegate: NavigationBarSettingsButtonItemProtocol) -> UIBarButtonItem {
        let image = UIImage(named: "image_todo")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let button = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: delegate, action: #selector(NavigationBarSettingsButtonItemProtocol.navigationBarSettingsButtonPressed))
        return button
    }
    
    static public func createAppTitleView() -> UIView {
        let image = UIImage(named: "image_todo")
        return UIImageView(image: image!)
    }
}
