//
//  UserInfo.swift
//  Assignment1
//
//  Created by TK-LPT-0142 on 11/18/19.
//  Copyright © 2019 TK-LPT-0142. All rights reserved.
//

import Foundation

class UserInfo  {
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.name = name
        self.id = id
    }
}

enum SortTypes :Int{
case sortById
case sortByName
}
