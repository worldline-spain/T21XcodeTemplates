//
//  ___FILEBASENAME___ViewController.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 05/07/2017.
//  Copyright (c) 2017 Worldline. All rights reserved.
//
//

import UIKit
import T21MaterialTextField
import Material
import T21KeyboardState
import T21Button
import Kingfisher
import MBProgressHUD
import RxCocoa
import RxSwift
import T21RxAdditions

// MARK: - Protocol to be defined at ViewController
protocol ___FILEBASENAME___ViewUpdatesHandler : class
{
    //That part should be implemented with RxSwift.
    func hideFeedbackLoadingError( _ message: String?)
}

// MARK: - ViewController Class must implement ViewModelHandler Protocol to handle ViewModel from Presenter
class ___FILEBASENAME___ViewController: ScrollViewKeyboardVC, ___FILEBASENAME___ViewUpdatesHandler
{
    //MARK: Relationships
    var presenter: ___FILEBASENAME___EventHandler!
    
    var viewModel : ___FILEBASENAME___ViewModel {
        return presenter.viewModel
    }
    @IBOutlet
    open weak var textFieldUserName : T21MaterialTextField!
    
    @IBOutlet
    open weak var textFieldPassword : T21MaterialTextField!
    
    @IBOutlet
    open weak var imageViewLogo: UIImageView!
    
    @IBOutlet
    open weak var buttonLogin: T21Button!
    
    @IBOutlet
    open weak var buttonForgotPassword: T21Button!
    
    @IBOutlet
    open weak var buttonRegister: T21Button!
    
    internal weak var currentActiveTextField: UITextField?
    
    // MARK: View Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        Logger.info("Load Login View")
        T21KeyboardState.sharedInstance.addObserver(obs: self)
        configureOutlets()
        configureBindings()
    }
    
    
    func configureBindings() {
        
        //Add the ViewModel bindings here ...
        _ = textFieldUserName.rx.text <-> viewModel.userName
        _ = textFieldPassword.rx.text <-> viewModel.password
        
        bindOnNext(viewModel.showUserNameError) { [weak self] (show) -> (Void) in
            if show {
                self?.textFieldUserName.feedbackStatus = FeedbackStatus.Error
            } else {
                self?.textFieldUserName.feedbackStatus = FeedbackStatus.None
            }
        }
        
        bindOnNext(viewModel.showPasswordError) { [weak self] (show) -> (Void) in
            if show {
                self?.textFieldPassword.feedbackStatus = FeedbackStatus.Error
            } else {
                self?.textFieldPassword.feedbackStatus = FeedbackStatus.None
            }
        }
        
        bindOnNext(viewModel.showLoadingFeedback) { [weak self] (show) -> (Void) in
            if show {
                self?.showFeedbackLoading()
            } else {
                self?.hideFeedbackLoading()
            }
        }
    }
    
    // MARK: Textfield Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldUserName {
            textFieldPassword.becomeFirstResponder()
        } else if textField == textFieldPassword {
            textField.resignFirstResponder()
        }
        return false
    }
    
    // MARK: Button actions
    
    @IBAction
    func buttonLoginPressed() {
        presenter.loginViewDidPressLoginButton()
    }
    
    @IBAction
    func buttonForgotPasswordPressed() {
        presenter.loginViewDidPressForgotPasswordButton()
    }
    
    @IBAction
    func buttonRegisterPressed() {
        presenter.loginViewDidPressRegisterButton()
    }
    
    //MARK: Login Interface
    
    func showFeedbackLoading() {
        self.view.endEditing(true)
        loadingHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingHUD?.mode = MBProgressHUDMode.indeterminate
        loadingHUD?.label.text = "Logging in..."
        loadingHUD?.removeFromSuperViewOnHide = true
    }
    
    func hideFeedbackLoading() {
        loadingHUD?.hide(animated: true)
    }
    
    func hideFeedbackLoadingError( _ message: String?) {
        self.hideWithErrorLoadingFeedback(message)
    }
    
    //MARK: Private methods
    
    private var loadingHUD: MBProgressHUD?
    
    //MARK: Feedback helpers
    
    private func hideWithErrorLoadingFeedback(_ message: String?) {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
        customView.backgroundColor = UIColor.red
        loadingHUD?.customView = customView
        loadingHUD?.mode = MBProgressHUDMode.customView
        loadingHUD?.label.text = message
        loadingHUD?.isUserInteractionEnabled = false
        loadingHUD?.hide(animated: true, afterDelay: 3)
        //loadingHUD?.offset = CGPoint(x: 0, y: MBProgressMaxOffset)
    }
    
    //MARK: UI Configuration
    
    private func configureOutlets() {
        
        //textfields
        configureMaterialTextfield(textFieldUserName)
        configureMaterialTextfield(textFieldPassword)
        
        //placeholders
        textFieldUserName.placeholder = "todo: User account"
        textFieldPassword.placeholder = "todo: Password"
        
        //default hint text
        textFieldUserName.hintText = "todo: Hint text for the account."
        textFieldPassword.hintText = "todo: Hint text for the password."
        
        //error hint/feedback text
        textFieldUserName.errorHintText = "todo: Error text for the account."
        textFieldPassword.errorHintText = "todo: Error text for the password."
        
        //buttons
        buttonLogin.setTitle("Login", for: UIControlState.normal)
        buttonLogin.setBackgroundColor(UIColor.blue, for: UIControlState.normal)
        buttonLogin.setBackgroundColor(UIColor.gray, for: UIControlState.highlighted)
        
        let forgotPasswordButtonCommonString = "todo: Forgot your password?"
        buttonForgotPassword.setBackgroundColor(UIColor.clear, for: UIControlState.normal)
        buttonForgotPassword.setAttributedTitle(prepareLabelButtonTitle(forgotPasswordButtonCommonString,UIColor.lightGray), for: UIControlState.normal)
        buttonForgotPassword.setAttributedTitle(prepareLabelButtonTitle(forgotPasswordButtonCommonString,UIColor.black), for: UIControlState.highlighted)
        
        let registerButtonCommonString = "todo: ___FILEBASENAME___? Create an account."
        buttonRegister.setBackgroundColor(UIColor.clear, for: UIControlState.normal)
        buttonRegister.setAttributedTitle(prepareLabelButtonTitle(registerButtonCommonString,UIColor.lightGray), for: UIControlState.normal)
        buttonRegister.setAttributedTitle(prepareLabelButtonTitle(registerButtonCommonString,UIColor.black), for: UIControlState.highlighted)
        
        imageViewLogo.kf.setImage(with: URL(string: "https://3.bp.blogspot.com/-7Vp80wIv_II/UpOyEqt2apI/AAAAAAAAAyE/MPStAQ3CUQw/s320/Star-Wars-Logo.png"))
    }
    
    private func prepareLabelButtonTitle(_ title: String, _ color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(
            string: title,
            attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16.0),
                         NSForegroundColorAttributeName:color,
                         NSUnderlineStyleAttributeName:NSUnderlineStyle.styleSingle.rawValue])
    }
    
    private func configureMaterialTextfield(_ textfield: T21MaterialTextField) {
        
        //placeholders
        textfield.placeholderActiveColor = UIColor.lightGray
        textfield.placeholderNormalColor = UIColor.lightGray
        
        //error hints and feedback
        textfield.hintTextNormalColor = UIColor.lightGray
        textfield.hintTextActiveColor = UIColor.blue
        textfield.hintTextErrorColor = UIColor.red
        
        //divider separators
        textfield.dividerNormalColor = UIColor.lightGray
        textfield.dividerErrorColor = UIColor.red
        textfield.dividerActiveColor = UIColor.blue
    }
}
