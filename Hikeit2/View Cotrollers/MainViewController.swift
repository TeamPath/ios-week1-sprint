//
//  MainViewController.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Artboard 1.png")
        self.view.insertSubview(backgroundImage, at: 0)

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        
    }

    
    @IBAction func signOutButton(_ sender: Any) {
      try! FIRAuth.auth()!.signOut()
        performSegue(withIdentifier: "PresentLoginNoAnimation", sender: self)
        
    }


}
