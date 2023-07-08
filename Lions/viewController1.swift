//
//  viewController1.swift
//  Lions
//
//  Created by ABDELHADI on 13/6/2023.
//
import Foundation
import UIKit

class ViewController1: UIViewController {
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           // Delay for 3 seconds and navigate to the "homeStory" storyboard
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                   self.presentHomeViewController()
               }
       }
       
    func presentHomeViewController() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let homeViewController = storyboard.instantiateViewController(withIdentifier: "introStory")
           present(homeViewController, animated: true, completion: nil)
       }
}

