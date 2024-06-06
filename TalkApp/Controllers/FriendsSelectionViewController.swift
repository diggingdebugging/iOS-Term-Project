//
//  FriendsViewController.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit
import SnapKit
import FirebaseFirestore

class FriendsSelectionViewController: UIViewController {
    //    let userManager = UserManager()
    var uid: String? // 로그인에 성공하여 받은 uid
    var currentUser: User? // 현재 사용자
    
    var friendsList: [User]? = []
    let friendsSelectionView = FriendsSelectionView()
    
    var dbFirebase: DbFirebase?
    
    
    override func loadView() {
        view = friendsSelectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        registerCellsToTableView()
        navigationBarUI()
        loadUserData()
    }
    
    func setDelegate(){ // tableView 역할위임
        friendsSelectionView.tableView.delegate = self
        friendsSelectionView.tableView.dataSource = self
    }
    
    func registerCellsToTableView() { // 셀 테이블뷰에 등록
        friendsSelectionView.tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        friendsSelectionView.tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "FriendsTableViewCell")
    }
    
}

// tableView 설정
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
            cell.nameLabel.text = currentUser?.name
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
            cell.nameLabel.text = friendsList?[indexPath.row].name
            //cell.nameLabel.text = user?.friends[indexPath.row].name
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

// NavigationBar UI
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

// Database
extension FriendsSelectionViewController {
    func loadUserData() {
        let db = Firestore.firestore()
        db.collection("user").whereField("uid", isEqualTo: uid!).getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            guard let documents = querySnapshot?.documents, let document = documents.first else {
                
                print("No matching documents found")
                return
            }
            
            let data = document.data()
            self.currentUser = User.fromDict(dict: data) // currentUser setting
            
            // 친구가 없는 경우
            guard let friendsUid = self.currentUser?.friendsUid, !friendsUid.isEmpty else {
                print("No friends found")
                DispatchQueue.main.async {
                    self.friendsSelectionView.tableView.reloadData() //그냥 테이블뷰를 Reload(), 나의 정보만 load
                }
                return
            }
            
            db.collection("user").whereField("uid", in: friendsUid).getDocuments { querySnapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No matching documents found")
                    return
                }
                
                self.friendsList = documents.map { User.fromDict(dict: $0.data()) }
                
                DispatchQueue.main.async {
                    self.friendsSelectionView.tableView.reloadData()
                }
            }
            
        }
        
    }
}
