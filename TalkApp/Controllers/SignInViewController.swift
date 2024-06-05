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
        let email = signInView.emailTextField.text ?? ""
        let password = signInView.passWordTextField.text ?? ""
        
        guard !email.isEmpty, !password.isEmpty else { return } // 둘 중에 하나라도 false 라면 함수종료!
        Auth.auth().signIn(withEmail: email, password: password) // 실패시 어떻게 처리할지는 코드 안짰음
        
        guard let user = Auth.auth().currentUser else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
        tabBarController.modalPresentationStyle = .fullScreen
        if let navController = tabBarController.viewControllers?[0] as? UINavigationController {
            let firstViewController = navController.viewControllers.first as? FriendsSelectionViewController
            firstViewController?.uid = user.uid
        }
        
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    @objc func signUpButtonTouched(){ // 회원가입 페이지로 이동
        performSegue(withIdentifier: "GotoSignUpViewController", sender: nil)
    }
}
