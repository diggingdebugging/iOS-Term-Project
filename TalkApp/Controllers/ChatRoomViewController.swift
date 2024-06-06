//
//  TalkRoomViewController.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    var friendsList: [User]? = []
    let chatRoomView = ChatRoomView()
    
    override func loadView() {
        view = chatRoomView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        registerCellsToTableView()
        navigationBarUI()
    }
    
    func setDelegate(){ // 역할위임
        chatRoomView.tableView.delegate = self
        chatRoomView.tableView.dataSource = self
    }
    
    func registerCellsToTableView() { // 셀 테이블뷰에 등록
        chatRoomView.tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        chatRoomView.tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "FriendsTableViewCell")
    }
    
    
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}

extension ChatRoomViewController {
    func navigationBarUI(){
        let titleLabel = UILabel().then {  // '친구' 제목
            $0.text = "채팅"
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
