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
        signInView.signUpbutton.addTarget(self, action: #selector(signUpButtonTouched), for: .touchUpInside)
    }
}

// Button Action
extension SignInViewController {
    @objc func signInButtonTouched(){ // 로그인 성공 시 친구 페이지로 이동
        
    }
    
    @objc func signUpButtonTouched(){ // 회원가입 페이지로 이동
        performSegue(withIdentifier: "GotoSignUpViewController", sender: nil)
    }
}
