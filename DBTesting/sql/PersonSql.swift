//
//  PersonSql.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 17/01/23.
//

import Foundation

class PersonSql {
    var id: String
    var name: String
    var age: Int
    var leResponse: String = ""
    
    init(id: String, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}
