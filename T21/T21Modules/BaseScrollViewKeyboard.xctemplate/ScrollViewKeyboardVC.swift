//
//  ScrollViewKeyboardVC.swift
//  T21ViewTemplates
//
//  Created by Eloi Guzmán Cerón on 15/11/16.
//  Copyright © 2016 Worldline. All rights reserved.
//

import UIKit
import T21MaterialTextField
import T21KeyboardState


class ScrollViewKeyboardVC: UIViewController, UITextFieldDelegate, T21KeyboardNotifications {
    
    var animateToTextfieldOffset : CGFloat = 44.0
    
    @IBOutlet
    open weak var scrollView: UIScrollView!
    
    private weak var currentActiveTextField: UITextField?
    
    // MARK: View Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        T21KeyboardState.sharedInstance.addObserver(obs: self)
    }

    // MARK: Keyboard Notifications
    
    func keyboardWillHide() {
        self.scrollView.contentInset = UIEdgeInsets.zero
        self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    func keyboardDidShow() {
        let keyboardSize = T21KeyboardState.sharedInstance.keyboardSize
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
        self.scrollView.contentInset = contentInsets;
        self.scrollView.scrollIndicatorInsets = contentInsets;
        
        if let textField = self.currentActiveTextField {
            animateScrollToTextfield(textField: textField)
        }
    }
    
    // MARK: Textfields and ScrollView
    
    func animateScrollToTextfield(textField: UITextField) {
        let keyboardSize = T21KeyboardState.sharedInstance.keyboardSize
        var viewFrame = self.view.frame
        viewFrame.size.height -= keyboardSize.height
        
        //get the point in parent coords.
        var point = self.view.convert(self.currentActiveTextField!.bounds.origin, from: self.currentActiveTextField!)
        point.y += self.view.frame.origin.y
        
        //add 44.0f the common UX minimum for each input field
        point.y += 44.0
        
        if (!viewFrame.contains(point)) {
            viewFrame = self.scrollView.convert(self.currentActiveTextField!.bounds, from: self.currentActiveTextField!)
            viewFrame.origin.y = viewFrame.origin.y + animateToTextfieldOffset
            DispatchQueue.main.async {
                self.scrollView.scrollRectToVisible(viewFrame, animated: true)
            }
        }
    }
    
    @IBAction
    func tapGestureRecognized(recognizer: UITapGestureRecognizer?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentActiveTextField = textField
        if T21KeyboardState.sharedInstance.isKeyboardShown {
            animateScrollToTextfield(textField: textField)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        currentActiveTextField = nil
    }
    
}
