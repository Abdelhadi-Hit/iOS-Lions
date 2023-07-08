//
//  verificationController.swift
//  Lions
//
//  Created by ABDELHADI on 13/6/2023.
//

import Foundation
import UIKit

class verificationController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var digit1TextField: UITextField!
    @IBOutlet var digit2TextField: UITextField!
    @IBOutlet var digit3TextField: UITextField!
    @IBOutlet var digit4TextField: UITextField!
    @IBOutlet var digit5TextField: UITextField!
    @IBOutlet var digit6TextField: UITextField!
    
    
    @IBOutlet weak var confirm: UIButton!
    
    
    

    var digitTextFields: [UITextField] {
        return [digit1TextField, digit2TextField, digit3TextField,digit4TextField,digit5TextField,digit6TextField]
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirm.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        
        
        for textField in digitTextFields {
            textField.delegate = self
        }
    }
    
    
    @objc func confirmButtonTapped() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "welcomeStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
    // Verify button action
    @IBAction func verifyButtonTapped(_ sender: UIButton) {
        // concatenate the digits to have a one code as string
        var verificationCode = ""
        for textField in digitTextFields {
            if let digit = textField.text {
                verificationCode += digit
            }
        }
        
        //verify with api , but i'll make a simple verifiction like code ="123456" :)
        verifyWithCode(verificationCode)
    }
    
    // move to next one
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // move to next field,....
        if string.count == 1 {
            textField.text = string
            
            // find index of text in the list
            if let currentIndex = digitTextFields.firstIndex(of: textField) {
                // Calculate the next index
                let nextIndex = currentIndex + 1
                
                // Check if there is a next text field
                if nextIndex < digitTextFields.count {
                    // Focus on the next text field
                    digitTextFields[nextIndex].becomeFirstResponder()
                } else {
                    // If this is the last digit field, dismiss the keyboard
                    textField.resignFirstResponder()
                }
            }
            
            return false //
        }
        
        return true
    }
    
    // here is the function to make simple verification
    func verifyWithCode(_ code: String) {
        
        if code == "123456" {
            print("Verification successful!")
        } else {
            print("Verification failed!")
        }
    }
}



