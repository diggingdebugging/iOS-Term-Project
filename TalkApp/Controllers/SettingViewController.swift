//
//  SettingViewController.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarUI()
        // Do any additional setup after loading the view.
    }

}

extension SettingViewController {
    func navigationBarUI(){
        let titleLabel = UILabel().then {  // '친구' 제목
            $0.text = "설정"
            $0.font = UIFont.systemFont(ofSize: 30, weight: .medium)
            $0.textColor = .black
            $0.textAlignment = .left
        }
        
        self.navigationController?.navigationBar.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
    }
}
