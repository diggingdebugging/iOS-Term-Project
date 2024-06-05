//
//  DbAction.swift
//  ch11-1871139-yujin-CityFirebase
//
//  Created by yujin on 5/8/24.
//

import Foundation

enum DbAction{
    case add, delete, modify
}

protocol Database{
    init(parentNotification: (([String:Any]? , DbAction?) -> Void)?)
    
    func setQuery(from: Any, to: Any)
    
    func saveChange(key: String, object: [String: Any], action: DbAction)
}
