//
//  FriendsTableViewCell.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10 // 이미지뷰를 원형으로 만들기 위해 코너를 설정
        $0.image = UIImage(named: "defaultImage")
    }
    
    let nameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        $0.textColor = .black
        $0.text = "."
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
    }
    
    func setConstraints() {
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
    }

}
