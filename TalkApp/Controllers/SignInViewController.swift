//
//  SignPageViewController.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    let signInView = SignInView()
    
    override func loadView() {
        view = signInView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    
    func addTarget(){
        signInView.signInButton.addTarget(self, action: #selector(signInButtonTouched), for: .touchUpInside)
    }
}

extension SignInViewController {
    @objc func signInButtonTouched(){
        
    }
}
