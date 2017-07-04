//
//  ___FILEBASENAME___ViewController.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 04/07/2017.
//  Copyright (c) 2017 Worldline. All rights reserved.
//
//

import Foundation
import UIKit

// MARK: - Protocol to be defined at ViewController
protocol ___FILEBASENAME___ViewUpdatesHandler : class
{
    func showLoadingFeedback(_ show: Bool)
}

// MARK: - ViewController Class must implement ViewModelHandler Protocol to handle ViewModel from Presenter
class ___FILEBASENAME___ViewController: UIViewController, ___FILEBASENAME___ViewUpdatesHandler
{
    //MARK: relationships
    var presenter: ___FILEBASENAME___EventHandler!
    
    var viewModel : ___FILEBASENAME___ViewModel {
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
    
    //MARK: ___FILEBASENAME___ViewUpdatesHandler
    
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
