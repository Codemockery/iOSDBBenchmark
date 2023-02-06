//
//  DBTestable.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 10/01/23.
//

import Foundation

protocol DBTestable {
    associatedtype DBItemType
    
    func read(key: String) -> Void
    
    func write<DBItemType>(obj: DBItemType) -> Void
    func writeBatch<DBItemType>(objs: [DBItemType]) -> Void
    
    func update(key: String) -> Void
    func updateBatch(keys: [String]) -> Void
    
    func delete(key: String) -> Void
//    func deleteBatch(keys: [String]) -> Void
    
    func generateObject(key: String) -> DBItemType
}
