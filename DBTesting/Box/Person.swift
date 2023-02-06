//
//  Person.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 16/01/23.
//

import Foundation
import ObjectBox

class Person: Entity {    
    var id: Id = 0
    var name: String?
    var age: Int?
    
    required init() {
        // no properties, so nothing to do here, ObjectBox calls this
    }
}
