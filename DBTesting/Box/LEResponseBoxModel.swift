//
//  LEResponseBoxModel.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 17/01/23.
//

import Foundation
import ObjectBox

class LEResponseBoxModel: Entity {
    var id: Id = 0
    var response: String?
    var name: String?
    var test: Int = 0
    
    required init() {
        // no properties, so nothing to do here, ObjectBox calls this
    }
}
