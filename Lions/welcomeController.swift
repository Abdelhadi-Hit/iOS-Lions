//
//  welcomeController.swift
//  Lions
//
//  Created by ABDELHADI on 13/6/2023.
//

import Foundation

import UIKit
import LocalAuthentication

class welcomeController: UIViewController {
    
    
    @IBOutlet weak var usePassword: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
           super.viewDidLoad()
           
           // Delay for 3 seconds and navigate to the "homeStory" storyboard
      /*  DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                   self.presentHomeViewController()
               }*/
       }
    
    
    @IBAction func goToSignIn(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "signInStory")
     homeViewController.modalPresentationStyle = .fullScreen
        present(homeViewController, animated: true, completion: nil)
        
        
    }
    
    
       
    func presentHomeViewController() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let homeViewController = storyboard.instantiateViewController(withIdentifier: "tabContainerStory")
        homeViewController.modalPresentationStyle = .fullScreen
           present(homeViewController, animated: true, completion: nil)
       }
    
    @IBAction func verifyPressed(_ sender: UIButton){
        let context: LAContext = LAContext()
        
        //touch id?. issupported !!!!
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please Verify Yourself :)") { issuccessfull, error in
                if issuccessfull{
                    //
                    self.statusLabel.text = "Done verifivation ✅"
                    self.presentHomeViewController()
                    
                }
                else{
                    //failaure
                    self.statusLabel.text = "Failure ❗️"
                }
            }
            
        }else{
            statusLabel.text = "Device don't support TouchID"
        }
        
        
}

}
