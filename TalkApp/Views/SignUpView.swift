//
//  SignUpView.swift
//  TalkApp
//
//  Created by yujin on 6/5/24.
//

import Foundation
import UIKit
import SnapKit
import Then


class SignUpView: UIView {
    // app name
    let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "회원가입"
        $0.textAlignment = .center
        $0.font = UIFont(name: "Jalnan2", size: 50)
    }
    
    // name
    let nameTextField = UITextField().then {
        $0.backgroundColor = UIColor.lightGray
        $0.placeholder = "이름"
        $0.layer.cornerRadius = 5
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
    
    // signUPbutton
    let signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
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
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passWordTextField)
        stackView.addArrangedSubview(signUpButton)
        
        addSubview(titleLabel)
        addSubview(stackView)
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
            $0.height.equalTo(200)
        }
    }
}
