//
//  CompletedActionsController.swift
//  Lions
//
//  Created by ABDELHADI on 19/6/2023.
//

import UIKit

class CompletedActionsController: UIViewController {
    
    @IBOutlet var MyView:UIView!
    @IBOutlet var MyView2:UIView!
    @IBOutlet var MyView3:UIView!
    @IBOutlet var MyView4:UIView!
    @IBOutlet var MyView5:UIView!
    @IBOutlet var MyView6:UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        
        
        
        MyView.addGestureRecognizer(tapGesture)
        MyView2.addGestureRecognizer(tapGesture2)
        MyView3.addGestureRecognizer(tapGesture3)
        MyView4.addGestureRecognizer(tapGesture4)
        MyView5.addGestureRecognizer(tapGesture5)
        MyView6.addGestureRecognizer(tapGesture6)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "mapStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "resumeStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }



}
