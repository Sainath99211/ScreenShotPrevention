//
//  SensitiveInfoViewController.swift
//  ScreenShotPrevention
//
//  Created by Sainath Tuptewar on 07/05/26.
//

import UIKit

class SensitiveInfoViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let window = view.window {
            ScreenshotProtectionManager.shared.enableProtection(for: window)
        }
    }

    
    @IBAction func nextVcBtn(_ sender: Any) {
        
        // Step 1: Disable protection
        ScreenshotProtectionManager.shared.disableProtection()

        // Step 2: Push
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(
                withIdentifier: "PasswordViewController"
            ) as? PasswordViewController else {
                assertionFailure("PasswordViewController not found")
                return
            }

            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
