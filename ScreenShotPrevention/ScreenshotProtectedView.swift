//
//  ScreenshotProtectedView.swift
//  ScreenShotPrevention
//
//  Created by Sainath Tuptewar on 06/05/26.
//

import UIKit

final class ScreenshotProtectedView: UIView {

    private let secureTextField: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.isUserInteractionEnabled = false
        return tf
    }()

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
        addSubview(secureTextField)
        secureTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secureTextField.topAnchor.constraint(equalTo: topAnchor),
            secureTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            secureTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            secureTextField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        guard let secureContainer = secureTextField.subviews.first else { return }
        secureContainer.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: secureContainer.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: secureContainer.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: secureContainer.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: secureContainer.trailingAnchor)
        ])
    }
}
