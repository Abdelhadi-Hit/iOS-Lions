//
//  viewController2.swift
//  Lions
//
//  Created by ABDELHADI on 13/6/2023.
//
import Foundation
import UIKit

class ViewController2: UIViewController {
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           // Delay for 3 seconds and navigate to the "homeStory" storyboard
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                   self.presentHomeViewController()
               }
       }
       
    func presentHomeViewController() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let homeViewController = storyboard.instantiateViewController(withIdentifier: "signInStory")
        
        homeViewController.modalPresentationStyle = .fullScreen
           present(homeViewController, animated: true, completion: nil)
       }
}


