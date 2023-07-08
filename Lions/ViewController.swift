//
//  ViewController.swift
//  Lions
//
//  Created by ABDELHADI on 9/6/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           // Delay for 3 seconds and navigate to the "homeStory" storyboard
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                   self.presentHomeViewController()
               }
       }
       
    func presentHomeViewController() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let homeViewController = storyboard.instantiateViewController(withIdentifier: "logoStory")
           present(homeViewController, animated: true, completion: nil)
       }
}

