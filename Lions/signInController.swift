//
//  signInController.swift
//  Lions
//
//  Created by ABDELHADI on 13/6/2023.
//

import Foundation
import UIKit



class signInController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    
    @IBOutlet weak var createAcc: UIButton!
    
    @IBOutlet weak var sign: UIButton!
    
    @IBOutlet weak var facebookSign:UIButton!
    @IBOutlet weak var googleSign:UIButton!
    @IBOutlet weak var linkedinSign: UIButton!
    
    @IBOutlet weak var scrollview:UIScrollView!
    
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAcc.addTarget(self, action: #selector(AccButtonTapped), for: .touchUpInside)
        
        sign.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
        
        emailField.delegate=self
        PasswordField.delegate=self
        
        //
       
        
        registerKeyboardNotifications()
    }
    
    
    @objc func AccButtonTapped() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "signUpStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
    //signIn
    
    @objc func signButtonTapped() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "tabContainerStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
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
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
       
       func unregisterKeyboardNotifications() {
           NotificationCenter.default.removeObserver(self)
       }
       
       @objc func keyboardWillShow(_ notification: Notification) {
           guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
               return
           }
           
           scrollview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
           scrollview.scrollIndicatorInsets = scrollview.contentInset
       }
       
       @objc func keyboardWillHide(_ notification: Notification) {
           scrollview.contentInset = .zero
           scrollview.scrollIndicatorInsets = .zero
       }
}
