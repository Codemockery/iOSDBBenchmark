//
//  BoxUtil.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 16/01/23.
//

import Foundation
import ObjectBox
import SQLite3

struct Util {
    public static func createBoxDB(name: String) -> Store? {
        var store: Store? = nil
        do {
            let appSupport = try FileManager.default.url(for: .applicationSupportDirectory,
                                                         in: .userDomainMask,
                                                         appropriateFor: nil,
                                                         create: true)
                                                         .appendingPathComponent(Bundle.main.bundleIdentifier!)

            let directory = appSupport.appendingPathComponent(name)
            try? FileManager.default.createDirectory(at: directory,
                                                     withIntermediateDirectories: true,
                                                     attributes: nil)
            store = try Store(directoryPath: directory.path, maxDbSizeInKByte: 1024 * 1024 * 1024)
        }
        catch {
        }
        return store
    }
    
    public static func getMachTimeInNano(startTime: UInt64, endTime: UInt64) -> UInt64 {
        var baseInfo = mach_timebase_info_data_t(numer: 0, denom: 0)
        var nano:UInt64 = 0
        
        if mach_timebase_info(&baseInfo) == KERN_SUCCESS {
            nano = (endTime - startTime) * UInt64(baseInfo.numer) / UInt64(baseInfo.denom)
        }
        return nano
    }
    
    public static func nanoToMilli(ns: UInt64) -> UInt64 {
        return ns / 1000000
    }
    
    public static func createSqlDB(name: String) -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    .appendingPathComponent(name)
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            print("Can't Open DB \(name)")
            return nil
        } else {
            print("Opened DB \(name)")
            return db
        }
    }
    
    public static func createPersonTable(db: OpaquePointer) {
        let createTableString = "CREATE TABLE IF NOT EXISTS person(id TEXT PRIMARY KEY,name TEXT,age INTEGER,leresponse TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) != SQLITE_DONE {
                print("Could Not Create Person Table")
            }
        } else {
            print("Could Not Prepare Person Table Query")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    public static func read(db: OpaquePointer, key: String) -> [PersonSql] {
        let queryStr = "SELECT * FROM person WHERE id=?;"
        var statement: OpaquePointer? = nil
        var persons : [PersonSql] = []
        if sqlite3_prepare_v2(db, queryStr, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (key as NSString).utf8String, -1, nil)
            
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = String(describing: String(cString: sqlite3_column_text(statement, 0)))
                let name = String(describing: String(cString: sqlite3_column_text(statement, 1)))
                let age = sqlite3_column_int(statement, 2)
                let leresponse = String(describing: String(cString: sqlite3_column_text(statement, 3)))
                let person = PersonSql(id: id, name: name, age: Int(age))
                person.leResponse = leresponse
                persons.append(person)
            }
        } else {
            print("Read From Person Table failed")
        }
        sqlite3_finalize(statement)
        return persons
        
    }
    
    public static func insert(person: PersonSql, db: OpaquePointer) {
        // Ignored check to see if entry already exists
        let insertStr = "INSERT INTO person (id, name, age, leresponse) VALUES (?, ?, ?, ?);"
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStr, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (person.id as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (person.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 3, Int32(person.age))
            sqlite3_bind_text(statement, 4, (person.leResponse as NSString).utf8String, -1, nil)
                 
            if sqlite3_step(statement) != SQLITE_DONE {
                print("Failed to insert \(person.name)")
            }
        } else {
            print("Person Insert Could not be Prepared.")
            
        }
        sqlite3_finalize(statement)
    }
    
    public static func batchInsert(persons: [PersonSql], db: OpaquePointer) {
        sqlite3_exec(db, "BEGIN IMMEDIATE TRANSACTION", nil, nil, nil)
        var statement: OpaquePointer? = nil
        let insertStr = "INSERT INTO person (id, name, age, leresponse) VALUES (?, ?, ?, ?);"
        
        if sqlite3_prepare_v2(db, insertStr, -1, &statement, nil) == SQLITE_OK {
            for count in 0..<persons.count {
                let person = persons[count]
                sqlite3_bind_text(statement, 1, (person.id as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 2, (person.name as NSString).utf8String, -1, nil)
                sqlite3_bind_int(statement, 3, Int32(person.age))
                sqlite3_bind_text(statement, 4, (person.leResponse as NSString).utf8String, -1, nil)
                     
                if sqlite3_step(statement) != SQLITE_DONE {
                    print("Failed to insert \(person.name)")
                }
                
                if (sqlite3_reset(statement) != SQLITE_OK) {
                    print("Failed to Reset \(person.name)")
                }
            }
        } else {
            print("Person Insert Could not be Prepared.")
            
        }
        sqlite3_finalize(statement)
        
        if (sqlite3_exec(db, "COMMIT TRANSACTION", nil, nil, nil) != SQLITE_OK) {
            print("Failed To Commit Transaction")
        }
    }
    
    public static func update(key: String, age: Int, db: OpaquePointer) {
        // Ignored check to see if entry exists
        let updateStr = "UPDATE person SET age=? WHERE name=?"
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, updateStr, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_int(statement, 1, Int32(age))
            sqlite3_bind_text(statement, 2, (key as NSString).utf8String, -1, nil)
            
            if sqlite3_step(statement) != SQLITE_DONE {
                print("Failed to Update \(key)")
            }
            
            if (sqlite3_reset(statement) != SQLITE_OK) {
                print("Failed to Reset \(key)")
            }
        } else {
            print("Person Update Could not be Prepared.")
            
        }
        sqlite3_finalize(statement)
    }
    
    public static func batchUpdate(keys: [String], age: Int, db: OpaquePointer) {
        sqlite3_exec(db, "BEGIN IMMEDIATE TRANSACTION", nil, nil, nil)
        var statement: OpaquePointer? = nil
        let updateQuery = "UPDATE person SET age=? WHERE name=?"
        
        // Ignored check to see if entry exists
        if sqlite3_prepare_v2(db, updateQuery, -1, &statement, nil) == SQLITE_OK {
            for count in 0..<keys.count {
                let key = keys[count]
                sqlite3_bind_int(statement, 1, Int32(age))
                sqlite3_bind_text(statement, 2, (key as NSString).utf8String, -1, nil)
                
                if sqlite3_step(statement) != SQLITE_DONE {
                    print("Failed to Update \(key)")
                }
                
                if (sqlite3_reset(statement) != SQLITE_OK) {
                    print("Failed to Reset \(key)")
                }
            }
        } else {
            print("Person Update Could not be Prepared.")
            
        }
        sqlite3_finalize(statement)
        
        if (sqlite3_exec(db, "COMMIT TRANSACTION", nil, nil, nil) != SQLITE_OK) {
            print("Failed To Commit Transaction")
        }
    }
}
