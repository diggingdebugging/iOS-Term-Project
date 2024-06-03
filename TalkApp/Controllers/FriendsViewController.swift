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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setUI()
    }
    
    func setDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
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
            return 10
        default:
            fatalError("Unexpected section")
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = MyCell()
            return cell
        case 1:
            let cell = FriendsCell()
            return cell
        default:
            fatalError("Unexpected section")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80.0
        case 1:
            return 60.0
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



