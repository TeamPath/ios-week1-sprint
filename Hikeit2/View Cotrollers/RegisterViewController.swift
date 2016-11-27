//
//  RegisterViewController.swift
//  Hikeit2
//
//  Created by Will Carty on 11/25/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController {
    
    var ref: FIRDatabaseReference!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var profileEmailField: UITextField!
    @IBOutlet weak var profilePasswordField: UITextField!
    @IBOutlet weak var profileConfirmPasswordField: UITextField!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Artboard 1.png")
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    fileprivate func showPicker(_ type: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = type
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func choosePhoto(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Picture", message: "Choose a picture type", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.showPicker(.camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            self.showPicker(.photoLibrary)
        }))
        present(alert, animated: true, completion: nil)
    }
        @IBAction func SignupButtonAction(_ sender: Any) {FIRAuth.auth()?.createUser(withEmail: profileEmailField.text!, password: profilePasswordField.text!, completion: { (user, error) in
        if error != nil {
            print(error!.localizedDescription)
        } else {
            print("User Created....")
        }
        let userId: String = user!.uid
        let userFullName: String = self.fullNameField.text!
        let userEmail: String = self.profileEmailField.text!
        let userImage: String = Utils.convertImageToBase64(image: self.profileImage.image)
        
        self.ref.child("Users").child("Profiles").child(userId).setValue(["UserID" : userId,
                                                            "UserName" : userFullName,
                                                            "UserEmail" : userEmail,
                                                            "UserImage" :  userImage])
           
        print(userId)
        
        
        
    })
        performSegue(withIdentifier: "MainSeg", sender: self)
   
        
    }
}
extension RegisterViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            let maxSize: CGFloat = 512
            let scale = maxSize / image.size.width
            let newHeight = image.size.height * scale
            
            UIGraphicsBeginImageContext(CGSize(width: maxSize, height: newHeight))
            image.draw(in: CGRect(x: 0, y: 0, width: maxSize, height: newHeight))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            profileImage.image = resizedImage
        }
    }
}

 
