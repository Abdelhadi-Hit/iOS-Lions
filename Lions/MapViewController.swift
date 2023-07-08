//
//  MapViewController.swift
//  Lions
//
//  Created by ABDELHADI on 17/6/2023.
//

import UIKit
import MapKit
import CoreLocation
import AVFoundation
import WebKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, WKNavigationDelegate {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webView: WKWebView!

   
    lazy var imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openCamera(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        
        //Mapbox
        
        webView.navigationDelegate = self
               
               if let htmlPath = Bundle.main.path(forResource: "map", ofType: "html") {
                   let htmlURL = URL(fileURLWithPath: htmlPath)
                   webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
               }

       

       
    }
    
    
    
    
    
    @IBAction func ConfirmButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "productStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
    
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "actionStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }


    
    
    
    
    
    

    
    
   

   
    

    // MARK: - Actions

    @IBAction func openCamera(_ sender: UITapGestureRecognizer) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.presentCamera()
        }
    }

    @IBAction func changePhoto(_ sender: UITapGestureRecognizer) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.presentCamera()
        }
    }

    private func presentCamera() {
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }

    // MARK: - UIImagePickerControllerDelegate

       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
           picker.dismiss(animated: true, completion: nil)

           DispatchQueue.global(qos: .background).async {
               if let image = info[.originalImage] as? UIImage {
                   self.processSelectedImage(image)
               }
           }
       }

       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
       }

       private func processSelectedImage(_ image: UIImage) {
           // Perform any processing tasks on the selected image asynchronously
           // Example tasks: filtering, resizing, uploading, etc.

           DispatchQueue.main.async {
               // Update UI or present the processed image on the main queue
               self.imageView.image = image
           }
       }
   }


