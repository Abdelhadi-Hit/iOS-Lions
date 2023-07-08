//
//  productViewController.swift
//  Lions
//
//  Created by ABDELHADI on 19/6/2023.
//

import UIKit

class productViewController: UIViewController {
    
    @IBOutlet private weak var radio1: UIButton!
    @IBOutlet private weak var radio2: UIButton!
    @IBOutlet private weak var radio3: UIButton!
    @IBOutlet private weak var radio4: UIButton!
    @IBOutlet private weak var radio5: UIButton!
    @IBOutlet private weak var radio6: UIButton!
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureButtons()
        
    }
    
    private func configureButtons() {
        let line1 = [radio1, radio2, radio3,radio4,radio5,radio6]
        
        let selectedImage = UIImage(named: "radio_button_on")
        let normalImage = UIImage(named: "radio-button-off")
        //line1
        for button in line1 {
            button?.tag = 1
            button?.setImage(selectedImage, for: .selected)
            button?.setImage(normalImage, for: .normal)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func radioButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        let buttons1 = [radio1, radio2, radio3,radio4,radio5,radio6]
        
        
        if sender.isSelected {
            if sender.tag == 1{
                for button in buttons1 where button != sender {
                    button?.isSelected = false
                }
            }}}
    
    
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "mapStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
    
    @IBAction func SendButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "evaluateStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }



}
