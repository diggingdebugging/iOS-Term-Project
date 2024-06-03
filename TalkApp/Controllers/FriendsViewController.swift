//
//  FriendsViewController.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import UIKit

class FriendsViewController: UIViewController {
    let friendsView = FriendsView()
    
    override func loadView() {
        view = friendsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    
    func setDelegate(){
        
    }
}



extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}




