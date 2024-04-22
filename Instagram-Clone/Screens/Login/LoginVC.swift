//
//  ViewController.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 22/04/24.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didLoginBtnClick(_ sender: Any) {
        let tabBarController = AppStoryboard.main.getViewController(TabBarController.self)
        if let window = self.getWindow() {
            window.rootViewController = tabBarController
            window.makeKeyAndVisible()
        }
    }
    
    @IBAction func didSignUpBtnClick(_ sender: Any) {
        let signUpVC = AppStoryboard.login.getViewController(SignUpVC.self)
        signUpVC.modalPresentationStyle = .fullScreen
        self.present(signUpVC, animated: true)
    }
    
}

