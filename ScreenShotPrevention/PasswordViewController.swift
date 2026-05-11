//
//  PasswordViewController.swift
//  ScreenShotPrevention
//
//  Created by Sainath Tuptewar on 08/05/26.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
    passwordTextField.placeholder = "Enter Your Password"
    passwordTextField.isSecureTextEntry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
}
