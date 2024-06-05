//
//  SignUpViewController.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    let signUpView = SignUpView()
    
    override func loadView() {
        view = signUpView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    
    func addTarget(){
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonTouched), for: .touchUpInside)
    }
}

extension SignUpViewController {
    @objc func signUpButtonTouched(){ // 회원가입버튼
        //
        let email = signUpView.emailTextField.text ?? ""
        let password = signUpView.passWordTextField.text ?? ""
        Auth.auth().createUser(withEmail: email, password: password)
        
        // 회원가입 성공시 SignInViewController로 돌아감
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
}
