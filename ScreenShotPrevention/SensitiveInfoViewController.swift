//
//  SensitiveInfoViewController.swift
//  ScreenShotPrevention
//
//  Created by Sainath Tuptewar on 07/05/26.
//

import UIKit

class SensitiveInfoViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let window = view.window {
            ScreenshotProtectionManager.shared.enableProtection(for: window)
        }
    }
//    override func viewWillAppear(_ animated: Bool) {
//        if let window = view.window {
//            ScreenshotProtectionManager.shared.enableProtection(for: window)
//        }
//    }
    
    @IBAction func nextVcBtn(_ sender: Any) {
        
//        // Disable before moving
//        ScreenshotProtectionManager.shared.disableProtection()
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let vc = storyboard.instantiateViewController(
//            withIdentifier: "PasswordViewController"
//        ) as? PasswordViewController else {
//            assertionFailure("PasswordViewController not found")
//            return
//        }
//        
//        present(vc, animated: true)
        
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
