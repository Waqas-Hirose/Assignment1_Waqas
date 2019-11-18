//
//  MockedData.swift
//  Assignment1
//
//  Created by TK-LPT-0142 on 11/15/19.
//  Copyright © 2019 TK-LPT-0142. All rights reserved.
//

import Foundation

class MockedData {

    static func getMockedUsersList() -> [UserInfo] {
        var usersList: [UserInfo] = []
        let user1 = UserInfo(id: 1, name:"Shiro")
        let user2 = UserInfo(id: 2, name:"Lina")
        let user3 = UserInfo(id: 3, name:"Wakaba")
        let user4 = UserInfo(id: 4, name:"Rin")
        
        usersList.append(user1)
        usersList.append(user2)
        usersList.append(user3)
        usersList.append(user4)
        
        return usersList
    }
}

