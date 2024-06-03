//
//  FriendsTableViewCell.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 10 // 이미지뷰를 원형으로 만들기 위해 코너를 설정
        profileImageView.image = UIImage(named: "defaultImage")
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        nameLabel.textColor = .black
        nameLabel.text = "."
        
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
