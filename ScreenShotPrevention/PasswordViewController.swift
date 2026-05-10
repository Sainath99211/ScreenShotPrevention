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
        passwordTextField.text = "12345"
    passwordTextField.isSecureTextEntry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        passwordTextField.isSecureTextEntry = true
//         Ensure full screen protection is OFF
//        ScreenshotProtectionManager.shared.disableProtection()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

//        applyProtectionToPasswordField()
    }

    private func applyProtectionToPasswordField() {

        guard let textField = passwordTextField else { return }

        // Avoid duplicate wrapping
        if textField.superview is ScreenshotProtectedView { return }

        let protectedView = ScreenshotProtectedView()
        protectedView.translatesAutoresizingMaskIntoConstraints = false

        guard let parent = textField.superview else { return }

        parent.addSubview(protectedView)

        NSLayoutConstraint.activate([
            protectedView.topAnchor.constraint(equalTo: textField.topAnchor),
            protectedView.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            protectedView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            protectedView.trailingAnchor.constraint(equalTo: textField.trailingAnchor)
        ])

        textField.removeFromSuperview()
        protectedView.contentView.addSubview(textField)

        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: protectedView.contentView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: protectedView.contentView.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: protectedView.contentView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: protectedView.contentView.trailingAnchor)
        ])
    }
}
