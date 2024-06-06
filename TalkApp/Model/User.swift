//
//  MemberData.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import Foundation

struct User {
    var uid: String
    var name: String
    var friendsUid: [String]?
    
    init(name: String, uid: String, friendsUid: [String]?) {
        self.uid = uid
        self.name = name
        self.friendsUid = friendsUid
    }
}

extension User{
    static func toDict(user: User) -> [String: Any]{
        var dict = [String: Any]()
        
        dict["uid"] = user.uid
        dict["name"] = user.name

        return dict
    }
    
    static func fromDict(dict: [String: Any]) -> User{
        
        let uid = dict["uid"] as! String
        let name = dict["name"] as! String
        let friendsUid = dict["friends"] as! [String]?

        return User(name: name, uid: uid, friendsUid: friendsUid)
    }
}













