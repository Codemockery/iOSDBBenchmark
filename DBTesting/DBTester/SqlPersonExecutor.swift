//
//  SqlPersonExecutor.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 17/01/23.
//

import Foundation
import SQLite3

class SqlPersonExecutor : DBTestable {
    typealias DBItemType = PersonSql
    let sqlDB = Util.createSqlDB(name: "mySqldb.sqlite")
    
    init() {
        if let _sqlDB = sqlDB {
            Util.createPersonTable(db: _sqlDB)
        }
    }
    
    func read(key: String) {
        guard let _sqlDB = sqlDB else { return }
        
        let _ = Util.read(db: _sqlDB, key: key)
    }
    
    func write<DBItemType>(obj: DBItemType) {
        guard let _sqlDB = sqlDB else { return }
        
        if let _item = obj as? PersonSql {
            Util.insert(person: _item, db: _sqlDB)
        }
    }
    
    func writeBatch<DBItemType>(objs: [DBItemType]) {
        guard let _sqlDB = sqlDB else { return }
        
        if let _items = objs as? [PersonSql] {
            Util.batchInsert(persons: _items, db: _sqlDB)
        }
    }
    
    func update(key: String) {
        guard let _sqlDB = sqlDB else { return }
        
        Util.update(key: key, age: 2, db: _sqlDB)
    }
    
    func updateBatch(keys: [String]) {
        guard let _sqlDB = sqlDB else { return }
        
        Util.batchUpdate(keys: keys, age: 2, db: _sqlDB)
    }
    
    func delete(key: String) {
        
    }
    
    func generateObject(key: String) -> PersonSql {
        let entry = PersonSql(id: key, name: key, age: 1)
        return entry
    }
}
