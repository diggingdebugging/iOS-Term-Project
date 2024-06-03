//
//  FriendsViewController.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit
import SnapKit

class FriendsViewController: UIViewController {
    let tableView = UITableView()
    let titleLabel = UILabel()    
    let user = User(name: "유진", userID: "1234")
    var friendsList: [User]? = User.friends
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        registerCellsToTableView()
        setUI() // UI extension에 따로 정의
    }
    
    func setDelegate(){ // 역할위임
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerCellsToTableView() { // 셀 테이블뷰에 등록
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "FriendsTableViewCell")
    }
    
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return friendsList?.count ?? 0
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
            return 90.0
        case 1:
            return 70.0
        default:
            fatalError("Unexpected section")
        }
    }
}


// UI구성
extension FriendsViewController {
    func setUI(){
        titleLabel.text = "친구"
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        
        //tableView.separatorStyle = .none // Remove the dividers
        
        addViews()
        setConstraints()
    }
    
    func setConstraints(){
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(0)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(0)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(0)
        }
        
    }
    
    func addViews(){
        self.navigationController?.navigationBar.addSubview(titleLabel)
        view.addSubview(tableView)
    }
}



