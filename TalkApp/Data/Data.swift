//
//  Data.swift
//  TalkApp
//
//  Created by yujin on 6/3/24.
//

import Foundation
import UIKit

struct Member{
    var id: Int
    var name: String
    var image: UIImage?
    var friends: [Member]?
}

struct MemberAccount{
    var id: String
    var passWord: String
}






