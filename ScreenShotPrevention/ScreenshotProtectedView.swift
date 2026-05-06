//
//  ScreenshotProtectedView.swift
//  ScreenShotPrevention
//
//  Created by Sainath Tuptewar on 06/05/26.
//

import UIKit

final class ScreenshotProtectedView: UIView {

    // This UITextField is the core of the trick.
    // When `isSecureTextEntry = true`, iOS prevents this view's layer
    // from being captured in screenshots or screen recordings.
    // We are NOT using it for input  only for its secure rendering behavior.
    private let secureTextField: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true   // "don't capture this content"
        tf.isUserInteractionEnabled = false // disable any user interaction
        return tf
    }()

    // This is the actual container where your real UI will live.
    // Anything added inside this view will inherit the screenshot protection.
    let contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {

        // Step 1: Add the secure text field to cover the entire view.
        // This acts as an invisible "security layer".
        addSubview(secureTextField)
        secureTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secureTextField.topAnchor.constraint(equalTo: topAnchor),
            secureTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            secureTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            secureTextField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        // Step 2: Access the internal container of the UITextField.
        // iOS renders secure content inside this internal view.
        // This is an undocumented behavior and may change in future iOS versions.
        guard let secureContainer = secureTextField.subviews.first else { return }

        // Step 3: Add our actual content inside this secure container.
        // Anything placed here becomes invisible in screenshots.
        secureContainer.addSubview(contentView)

        // Step 4: Pin the content to fully fill the secure container.
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: secureContainer.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: secureContainer.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: secureContainer.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: secureContainer.trailingAnchor)
        ])
    }
}
