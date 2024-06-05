//
//  SignUpViewController.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
        let name = signUpView.nameTextField.text ?? ""
        let email = signUpView.emailTextField.text ?? ""
        let password = signUpView.passWordTextField.text ?? ""
        
        guard !email.isEmpty, !password.isEmpty else{return} // 둘 중에 하나라도 false 라면 함수종료!
        
        // auth 생성
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                return
            }
            
            guard let authResult = authResult else { return }
            
            // Get the uid from the created user
            let uid = authResult.user.uid
            
            let user = User(name: name, uid: uid)
            
            let db = Firestore.firestore().collection("user").addDocument(data: User.toDict(user: user))
        }
        
        
        // FireStore
        
        
        
        // 회원가입 성공시 SignInViewController로 돌아감
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
