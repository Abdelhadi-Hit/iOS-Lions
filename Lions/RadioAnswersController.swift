//
//  RadioAnswersController.swift
//  Lions
//
//  Created by ABDELHADI on 18/6/2023.
//
import UIKit

class RadioAnswersController: UIViewController {
    @IBOutlet private weak var radio1Button: UIButton!
    @IBOutlet private weak var radio2Button: UIButton!
    @IBOutlet private weak var radio3Button: UIButton!
    @IBOutlet private weak var radio4Button: UIButton!
    @IBOutlet private weak var radio5Button: UIButton!
    @IBOutlet private weak var radio6Button: UIButton!
    @IBOutlet private weak var radio7Button: UIButton!
    @IBOutlet private weak var radio8Button: UIButton!
    @IBOutlet private weak var radio9Button: UIButton!
    @IBOutlet private weak var radio10Button: UIButton!
    @IBOutlet private weak var radio11Button: UIButton!
    @IBOutlet private weak var radio12Button: UIButton!
    @IBOutlet private weak var radio13Button: UIButton!
    @IBOutlet private weak var radio14Button: UIButton!
    @IBOutlet private weak var radio15Button: UIButton!
    @IBOutlet private weak var radio16Button: UIButton!
    @IBOutlet private weak var radio17Button: UIButton!
    @IBOutlet private weak var radio18Button: UIButton!
    @IBOutlet private weak var radio19Button: UIButton!
    @IBOutlet private weak var radio20Button: UIButton!
    @IBOutlet private weak var radio21Button: UIButton!
    @IBOutlet private weak var radio22Button: UIButton!
    @IBOutlet private weak var radio23Button: UIButton!
    @IBOutlet private weak var radio24Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    private func configureButtons() {
        //line1
        //let radioButtons = [radio1Button, radio2Button, radio3Button,radio4Button,radio5Button,radio6Button,radio7Button,radio8Button,radio9Button,radio10Button,radio11Button,radio12Button,radio13Button,radio14Button,radio15Button,radio16Button,radio17Button,radio18Button,radio19Button,radio20Button,radio21Button,radio22Button,radio23Button,radio24Button]
        
        
        let line1 = [radio1Button, radio2Button, radio3Button]
        let line2 = [radio4Button,radio5Button,radio6Button]
        let line3 = [radio7Button,radio8Button,radio9Button]
        let line4 = [radio10Button,radio11Button,radio12Button]
        let line5 = [radio13Button,radio14Button,radio15Button]
        let line6 = [radio16Button,radio17Button,radio18Button]
        let line7 = [radio19Button,radio20Button,radio21Button]
        let line8 = [radio22Button,radio23Button,radio24Button]
        
        
        let selectedImage = UIImage(named: "radio_button_on")
        let normalImage = UIImage(named: "radio-button-off")
        //line1
        for button in line1 {
            button?.tag = 1
            button?.setImage(selectedImage, for: .selected)
            button?.setImage(normalImage, for: .normal)
        }
        
        //line2
        for button in line2 {
            button?.tag = 2
            button?.setImage(selectedImage, for: .selected)
            button?.setImage(normalImage, for: .normal)
        }
        
        //line3
        for button in line3 {
            button?.tag = 3
            button?.setImage(selectedImage, for: .selected)
            button?.setImage(normalImage, for: .normal)
        }
        
        //line4
        for button in line4 {
            button?.tag = 4
            button?.setImage(selectedImage, for: .selected)
            button?.setImage(normalImage, for: .normal)
        }
        //line5
        
        for button in line5 {
            button?.tag = 5
            button?.setImage(selectedImage, for: .selected)
            button?.setImage(normalImage, for: .normal)
        }
        
        //line6
        
        for button in line6 {
            button?.tag = 6
            button?.setImage(selectedImage, for: .selected)
            button?.setImage(normalImage, for: .normal)
        }
        
        //line7
        for button in line7 {
            button?.tag = 7
            button?.setImage(selectedImage, for: .selected)
            button?.setImage(normalImage, for: .normal)
        }
        
        //line8
        for button in line8 {
            button?.tag = 8
            button?.setImage(selectedImage, for: .selected)
            button?.setImage(normalImage, for: .normal)
        }
        
    }
    
    @IBAction func radioButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        let buttons1 = [radio1Button, radio2Button, radio3Button]
        let buttons2 = [radio4Button, radio5Button, radio6Button]
        let buttons3 = [radio7Button,radio8Button,radio9Button]
        let buttons4 = [radio10Button,radio11Button,radio12Button]
        let buttons5 = [radio13Button,radio14Button,radio15Button]
        let buttons6 = [radio16Button,radio17Button,radio18Button]
        let buttons7 = [radio19Button,radio20Button,radio21Button]
        let buttons8 = [radio22Button,radio23Button,radio24Button]
        
        if sender.isSelected {
            if sender.tag == 1{
                for button in buttons1 where button != sender {
                    button?.isSelected = false
                }
            }else if sender.tag == 2{
                for button in buttons2 where button != sender {
                    button?.isSelected = false
                
            }
            
           
        }else if sender.tag == 3{
            for button in buttons3 where button != sender {
                button?.isSelected = false
            
            }}else if sender.tag == 4{
                for button in buttons4 where button != sender {
                    button?.isSelected = false
                
                }}else if sender.tag == 5{
                    for button in buttons5 where button != sender {
                        button?.isSelected = false
                    
                    }}else if sender.tag == 6{
                        for button in buttons6 where button != sender {
                            button?.isSelected = false
                        
                        }}else if sender.tag == 7{
                            for button in buttons7 where button != sender {
                                button?.isSelected = false
                            
                            }}else if sender.tag == 8{
                                for button in buttons8 where button != sender {
                                    button?.isSelected = false
                                
                                }}
    }
}
    
    
    
    
    //
    
    @IBAction func SendButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "pictureStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "productStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
}
