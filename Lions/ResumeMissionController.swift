//
//  ResumeMissionController.swift
//  Lions
//
//  Created by ABDELHADI on 16/6/2023.
//

import UIKit

class ResumeMissionController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var progress: UIButton!
    
    var mission:Mission?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pr_cornerRadius: CGFloat=18
        
        progress.layer.cornerRadius = pr_cornerRadius
        progress.clipsToBounds = true
        
        self.navigationController?.navigationBar.isHidden = false
        
        scrollView.contentSize = CGSize(width: 318, height: 500)

        // Do any additional setup after loading the view.
        
        DispatchQueue.main.async { [self] in
            self.titleLabel.text = self.mission?.title
        }
        
        if let imageName = mission?.image {
            imageView.image = UIImage(named: imageName)
        } else {
            imageView.image = UIImage(named: "Ellipse 3")
        }
        
        //
        
        
        
        
        
        
        
     
        
       

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "home")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
    @IBAction func ResumeButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "actionStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }


}
