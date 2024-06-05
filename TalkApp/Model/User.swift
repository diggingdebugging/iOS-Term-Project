//
//  MemberData.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import Foundation

//struct User {
//    let name: String
//    let userID: String
//}

struct User {
    var uid: String
    var name: String
    var friends: [User]?
    
    init(name: String, uid: String) {
        self.uid = uid
        self.name = name
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

        return User(name: name, uid: uid)
    }
}

extension User {
    static let friends = [
        User(name: "친구", uid: "1234"),
        User(name: "친구", uid: "1234"),
        User(name: "친구", uid: "1234"),
        User(name: "친구", uid: "1234"),
        User(name: "친구", uid: "1234"),
        User(name: "친구", uid: "1234"),
        User(name: "친구", uid: "1234"),
        User(name: "친구", uid: "1234"),
        User(name: "친구", uid: "1234")
    ]
}













