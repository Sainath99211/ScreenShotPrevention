//
//  ScreenshotProtectionManager.swift
//
//  Created by Sainath Tuptewar on 06/05/26.
//

import UIKit

final class ScreenshotProtectionManager {

    @MainActor static let shared = ScreenshotProtectionManager()
    private init() {}

    private weak var protectedWindow: UIWindow?
    private var secureTextField: UITextField?
    private var securedOverlay: UIView?
    var isEnabled = false

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func enableProtection(for window: UIWindow) {

        // guard let secureTextField else { return }
        guard !isEnabled else { return }
        isEnabled = true

        let field = UITextField()
        // Keep isSecureTextEntry to true (disables capture/recording of content)
        field.isSecureTextEntry = true

        // Create protection view
        let protectionView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: field.frame.size.width,
                height: field.frame.size.height
            )
        )

        protectionView.backgroundColor = .white

        let label = UILabel(
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height
            )
        )

        label.text = "Content Hidden for Security"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .gray

        protectionView.addSubview(label)

        // Required to position the text correctly
        field.leftView = protectionView
        field.leftViewMode = .always

        // Add field to window
        window.addSubview(field)

        // Store references
        self.protectedWindow = window
        self.secureTextField = field

        // Layer manipulation for screenshot protection
        window.layer.superlayer?.addSublayer(field.layer)
        field.layer.sublayers?.last?.addSublayer(window.layer)

        print("Screenshot protection enabled")
    }
}
