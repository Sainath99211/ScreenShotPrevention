//
//  SensitiveInfoViewController.swift
//  ScreenShotPrevention
//
//  Created by Sainath Tuptewar on 07/05/26.
//

import UIKit

class SensitiveInfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextVcBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PasswordViewController") as? PasswordViewController else {
            assertionFailure("PasswordViewController not found in storyboard")
            return
        }
        present(vc, animated: true)
    }
}
