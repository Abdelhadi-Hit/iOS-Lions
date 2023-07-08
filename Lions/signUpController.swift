//
//  signUpController.swift
//  Lions
//
//  Created by ABDELHADI on 9/6/2023.
//

import Foundation
import UIKit


class signUpController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var selfie: UIButton!
    @IBOutlet weak var upload: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var scrollContainer: UIScrollView!
    
    @IBOutlet var firstnameField: UITextField!
    @IBOutlet var lastnameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    
    var activeTextField: UITextField?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            signUp.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
            
            firstnameField.delegate = self
            lastnameField.delegate = self
            emailField.delegate = self
            phoneField.delegate = self
            passwordField.delegate = self
            
            // Calculate and set the content size of the scroll view
            let contentHeight = firstnameField.frame.size.height + lastnameField.frame.size.height + emailField.frame.size.height + phoneField.frame.size.height + passwordField.frame.size.height
            scrollContainer.contentSize = CGSize(width: scrollContainer.frame.width, height: contentHeight)
            
            registerKeyboardNotifications()
        }
        
        @objc func signUpButtonTapped() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let view = storyboard.instantiateViewController(withIdentifier: "verificationStory")
            view.modalPresentationStyle = .fullScreen
            present(view, animated: true, completion: nil)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            registerKeyboardNotifications()
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            unregisterKeyboardNotifications()
        }
        
        func registerKeyboardNotifications() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        }
        
        func unregisterKeyboardNotifications() {
            NotificationCenter.default.removeObserver(self)
        }
        
        @objc func keyboardWillShow(_ notification: Notification) {
            guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
                  let activeTextField = activeTextField else {
                return
            }
            
            let textFieldFrame = activeTextField.convert(activeTextField.bounds, to: view)
            let keyboardY = view.frame.size.height - keyboardFrame.size.height
            
            if textFieldFrame.maxY > keyboardY {
                let offsetY = textFieldFrame.maxY - keyboardY + 10
                scrollContainer.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)
            } else {
                scrollContainer.setContentOffset(CGPoint.zero, animated: true)
            }
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            activeTextField = textField
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
}
