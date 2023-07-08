//
//  AppleMAp.swift
//  Lions
//
//  Created by ABDELHADI on 23/6/2023.
//

import UIKit
import MapKit
import CoreLocation
import AVFoundation

class AppleMApController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!

    let locationManager = CLLocationManager()
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

        mapView.delegate = self

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        mapView.showsUserLocation = true
        locationManager.startUpdatingLocation()
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


    
    
    
    
    
    

    // MARK: - CLLocationManagerDelegate

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            print("Location authorization denied or restricted.")
        case .notDetermined:
            break
        @unknown default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.first?.coordinate else { return }

        let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = userLocation
        mapView.addAnnotation(annotation)

        locationManager.stopUpdatingLocation()

        DispatchQueue.global(qos: .background).async {
            self.performReverseGeocoding(for: userLocation)
        }
    }

    private func performReverseGeocoding(for coordinate: CLLocationCoordinate2D) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let self = self else { return }

            if let error = error {
                print("Reverse geocoding failed: \(error.localizedDescription)")
                return
            }

            if let placemark = placemarks?.first {
                if let thoroughfare = placemark.thoroughfare,
                    let subThoroughfare = placemark.subThoroughfare,
                    let locality = placemark.locality,
                    let postalCode = placemark.postalCode,
                    let country = placemark.country {

                    let address = "\(subThoroughfare) \(thoroughfare), \(locality), \(postalCode), \(country)"
                    print("User's Address: \(address)")
                }
            }
        }
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


