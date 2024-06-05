//
//  File.swift
//  TalkApp
//
//  Created by yujin on 6/5/24.
//

import Foundation
import UIKit
import SnapKit
import Then

class FriendsSelectionView: UIView {
    let tableView = UITableView() // 테이블뷰
    
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
    
    
    func setConstraints(){ // constraint 설정
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(0)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(0)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(0)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).inset(0)
        }
        
    }
    
    func addViews() { // 뷰에 등록        
        addSubview(tableView)
    }
}
