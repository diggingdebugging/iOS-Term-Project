//
//  FriendsViewController.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit
import SnapKit

class FriendsSelectionViewController: UIViewController {
    
    let user = User(name: "유진", userID: "1234")
    var friendsList: [User]? = User.friends
    let friendsSelectionView = FriendsSelectionView()
    
    override func loadView() {
        view = friendsSelectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        registerCellsToTableView()
        navigationBarUI()
        
    }
    
    func setDelegate(){ // 역할위임
        friendsSelectionView.tableView.delegate = self
        friendsSelectionView.tableView.dataSource = self
    }
    
    func registerCellsToTableView() { // 셀 테이블뷰에 등록
        friendsSelectionView.tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        friendsSelectionView.tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "FriendsTableViewCell")
    }
    
}

extension FriendsSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return friendsList!.count
        default:
            fatalError("Unexpected section")
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
            cell.nameLabel.text = "나"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
            cell.nameLabel.text = friendsList?[indexPath.row].name
            return cell
        default:
            fatalError("Unexpected section")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100.0
        case 1:
            return 70.0
        default:
            fatalError("Unexpected section")
        }
    }
}

extension FriendsSelectionViewController {
    func navigationBarUI(){
        let titleLabel = UILabel().then {  // '친구' 제목
            $0.text = "친구"
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

