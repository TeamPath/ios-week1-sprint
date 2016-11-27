//
//  HikeDetailViewController.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HikeDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var ref: FIRDatabaseReference!
    var imagePassed = UIImage()
    let map = MapViewController()
    var hikeCount = "1"
    
    
    @IBOutlet weak var hikeDifficultyLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var hikeImage: UIImageView!
    @IBOutlet weak var hikeTitle: UITextField!
    @IBOutlet weak var hikeLocation: UITextField!
   
    @IBOutlet weak var hikeDiscriptionView: UITextView!
   

    
    
    @IBOutlet weak var hikeIdNumerSelector: UIStepper!
    @IBOutlet weak var hikeIdNumer: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
    }
    
    @IBAction func hikeIdStepper(_ sender: UIStepper) {
    hikeIdNumer.text = String(Int(sender.value))
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        let easy = "Walk In The Park"
        let medium = "That Was A Nice Hike"
        let hard = "That Was No Walk In The Park"
        
        switch slider.value {
        case 1...1.5:
            hikeDifficultyLabel.text = easy
        case 1.6...2.5:
            hikeDifficultyLabel.text = medium
        case 2.6...3:
            hikeDifficultyLabel.text = hard
        default:
            return
        }
        
    }
    
    @IBAction func pickHikePhoto(_ sender: Any) {
    choosePhoto()
    }
    
    
    @IBAction func saveHikeToFirebase(_ sender: Any) {
        let hikeTitle = self.hikeTitle.text!
        let hikeLocation = self.hikeLocation.text!
       
        let hikeChallenge = self.hikeDifficultyLabel.text!
        let userImage: String = Utils.convertImageToBase64(image: self.hikeImage.image)
        let hikeDiscrip: String = self.hikeDiscriptionView.text
        let hikeDate: String = String(describing: Date())
        self.ref.child("Hikes").child(hikeIdNumer.text!).setValue([                                                        "HikeTitle":
                                                                     hikeTitle,
                                                                            "HikeLocation" : hikeLocation,
                                                                            "HikeChallenge" : hikeChallenge,
                                                                            "HikeImage1" :
                                                                     userImage,
                                                                            "HikeDiscript" : hikeDiscrip,
                                                                            "HikeDate" :
                                                 hikeDate])
        print("Details saved")
    }
    
    
    
    
    
    
    
    
    
    fileprivate func showPicker(_ type: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = type
        present(imagePicker, animated: true, completion: nil)
      
    }
    
    func choosePhoto() {
        let alert = UIAlertController(title: "Picture", message: "Choose a picture type", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.showPicker(.camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            self.showPicker(.photoLibrary)
        }))
        present(alert, animated: true, completion: nil)
       
    print("Image Tapped")
    }
    
}
extension HikeDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            let maxSize: CGFloat = 50
            let scale = maxSize / image.size.width
            let newHeight = image.size.height * scale
            
            UIGraphicsBeginImageContext(CGSize(width: maxSize, height: newHeight))
            image.draw(in: CGRect(x: 0, y: 0, width: maxSize, height: newHeight))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            hikeImage.image = resizedImage
        }
    }
}













