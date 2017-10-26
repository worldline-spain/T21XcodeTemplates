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
protocol ___VARIABLE_productName:identifier___ViewUpdatesHandler: class
{
    func showLoadingFeedback(_ show: Bool)
}

// MARK: - ViewController Class must implement ViewModelHandler Protocol to handle ViewModel from Presenter
class ___VARIABLE_productName:identifier___ViewController: UIViewController, ___VARIABLE_productName:identifier___ViewUpdatesHandler
{
    //MARK: relationships
    var presenter: ___VARIABLE_productName:identifier___EventHandler!
    
    var viewModel: ___VARIABLE_productName:identifier___ViewModel {
        return presenter.viewModel
    }
    
    //MARK: Outlets
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var buttonRetry: UIButton!
    
    //MARK: View Lifecycle
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.handleViewWillDisappear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
        configureOutlets()
        showLoadingFeedback(true)
    }
    
    func configureBindings() {
        //Add the ViewModel bindings here ...
    }
    
    //MARK: UI Configuration
    
    func configureOutlets() {
        buttonRetry.setTitle("Try again!", for: UIControlState.normal)
        buttonRetry.setTitleColor(UIColor.blue, for: UIControlState.normal)
        buttonRetry.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        spinnerView.color = UIColor.green
    }
    
    //MARK: ___VARIABLE_productName:identifier___ViewUpdatesHandler
    
    func showLoadingFeedback(_ show: Bool) {
        if show {
            spinnerView.isHidden = false
            spinnerView.startAnimating()
            buttonRetry.isHidden = true
        } else {
            spinnerView.isHidden = true
            spinnerView.stopAnimating()
            buttonRetry.isHidden = false
        }
    }
    
    //MARK: Button Actions
    
    @IBAction func buttonRetryPressed() {
        presenter?.handleRetryButtonPressed()
    }
}
