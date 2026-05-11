//
//  ScreenshotProtectionManager.swift
//
//  Created by Sainath Tuptewar on 06/05/26.
//

import UIKit

final class ScreenshotProtectionManager {

    static let shared = ScreenshotProtectionManager()
    private init() {}

    private weak var window: UIWindow?
    private var secureTextField: UITextField?
    private var originalSuperlayer: CALayer?

    var isEnabled = false

    func enableProtection(for window: UIWindow) {

        guard !isEnabled else { return }
        isEnabled = true

        self.window = window

        let field = UITextField()
        field.isSecureTextEntry = true
        field.isUserInteractionEnabled = false
        
        
        //Lable to show text on the black view.
        let protectionView = UIView(frame: CGRect(x: 0, y: 0, width: field.frame.size.width, height: field.frame.size.height))
        protectionView.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        label.text = "Content Hidden for Security"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18,weight: .bold)
        label.textColor = .gray
        protectionView.addSubview(label)
        
        //Below 2 line required to place the position of text
        field.leftView = protectionView
        field.leftViewMode = .always
        
        window.addSubview(field)

        // ✅ Save original layer
        originalSuperlayer = window.layer.superlayer

        // Apply hack
        window.layer.superlayer?.addSublayer(field.layer)
        field.layer.sublayers?.last?.addSublayer(window.layer)

        secureTextField = field

        print("✅ Protection Enabled")
    }

    func disableProtection() {

        guard isEnabled else { return }
        isEnabled = false

        guard let window = window else { return }

        // ✅ Restore layer hierarchy
        if let originalSuperlayer = originalSuperlayer {
            originalSuperlayer.addSublayer(window.layer)
        }

        secureTextField?.removeFromSuperview()
        secureTextField = nil
        self.window = nil

        print("❌ Protection Disabled")
    }
}
