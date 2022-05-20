//
//  Users.swift
//  homeWork1(Tasks)
//
//  Created by Умар on 12/5/22.
//

import Foundation
class Users {
    var name: String
    var password : String
    
    init(name:String, password:String){
        self.name = name
        self.password = password
    }
}

class LocalStore {
    static var shared = LocalStore()
    var user: Users?
    private init() {}
}
