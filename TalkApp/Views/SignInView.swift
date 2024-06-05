//
//  SiginInView.swift
//  TalkApp
//
//  Created by yujin on 6/5/24.
//

import Foundation
import UIKit
import SnapKit
import Then

class SignInView: UIView{
    // app name
    let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "Talk App"
        $0.textAlignment = .center
        $0.font = UIFont(name: "Jalnan2", size: 50)
    }
    
    // email
    let emailTextField = UITextField().then {
        $0.backgroundColor = UIColor.lightGray
        $0.placeholder = "이메일"
        $0.layer.cornerRadius = 5
    }
    
    // password
    let passWordTextField = UITextField().then {
        $0.backgroundColor = UIColor.lightGray
        $0.placeholder = "비밀번호"
        $0.layer.cornerRadius = 5
    }
    
    // loginbutton
    let signInButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = UIColor.black
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 5
    }
    
    // stackview
    let stackView = UIStackView().then {
        $0.spacing = 10
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.axis = .vertical
    }
    
    // signUpButton
    let signUpbutton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        $0.backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.backgroundColor = .white
    }
    
    func addViews(){
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passWordTextField)
        stackView.addArrangedSubview(signInButton)
        
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(signUpbutton)
    }
    
    func setConstraints(){
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(150)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(0)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).inset(0)
            $0.height.equalTo(100)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(20)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(150)
        }
        
        signUpbutton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(20)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(20)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
}
