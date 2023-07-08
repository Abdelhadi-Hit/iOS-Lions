//
//  CameraAndAudioController.swift
//  Lions
//
//  Created by ABDELHADI on 18/6/2023.
//

import AVFoundation
import UIKit

class CameraAndAudioController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var audioTextField: UITextField!
    @IBOutlet weak var palyPause: UIButton!
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
   // @IBOutlet weak var TextField3: UITextField!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    var isRecording = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioRecording()
        audioTextField.delegate = self
        TextField1.delegate = self
        TextField2.delegate = self
        
        
        //
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openCamera(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
    }
    
    
    
    //
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true}
    
    
    
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        // Handle back button tapped event
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "evaluateStory")
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    //
    
    
    
    func setupAudioRecording() {
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.playAndRecord, mode: .default)
            try session.setActive(true)
            session.requestRecordPermission { [weak self] allowed in
                DispatchQueue.main.async {
                    self?.recordButton.isEnabled = allowed
                }
            }
        } catch {
            print("Error setting up audio recording: \(error.localizedDescription)")
        }
    }
    
    func startRecording() {
        guard let audioFilename = getDocumentsDirectory()?.appendingPathComponent("recording.m4a") else {
            print("Error getting audio file URL")
            return
        }
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
            isRecording = true
            
            // Update the text field with the recording status
            audioTextField.text = "Recording..."
            recordButton.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        } catch {
            print("Error starting audio recording: \(error.localizedDescription)")
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        audioRecorder = nil
        isRecording = false
        
        // Update the text field with the recorded audio file name
        audioTextField.text = "recording.m4a"
        recordButton.setImage(UIImage(systemName: "mic"), for: .normal)
        
        // Load the audio file for playback
        if let audioURL = getDocumentsDirectory()?.appendingPathComponent("recording.m4a") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                audioPlayer?.delegate = self
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading audio for playback: \(error.localizedDescription)")
            }
        } else {
            print("Error getting audio file URL")
        }
    }
    
    func playAudio() {
        audioPlayer?.play()
        palyPause.setImage(UIImage(systemName: "squareshape.fill"), for: .normal)
    }
    
    func pauseAudio() {
        audioPlayer?.pause()
        palyPause.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    
    @IBAction func recordButtonPressed(_ sender: UIButton) {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        if audioPlayer?.isPlaying == true {
            pauseAudio()
        } else {
            playAudio()
        }
    }
    
    func getDocumentsDirectory() -> URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths.first
    }
    
   
    
    
    
    // Camera Setup  .. ::)
    @IBAction func openCamera(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func changePhoto(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
