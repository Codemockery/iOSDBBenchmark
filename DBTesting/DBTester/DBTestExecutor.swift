//
//  DBTestExecutor.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 10/01/23.
//

import Foundation
import ObjectBox

struct DBTestExecutor: DBTestExecutable {
    private var dbOperation: any DBTestable
    private let iterations: Int = 2500
    private let batchSize: Int = 10
    
    init(dbTestable: any DBTestable) {
        dbOperation = dbTestable
    }
    
    public func writeAll() -> UInt64 {
        let time = mach_absolute_time()
        for count in 1..<iterations {
            dbOperation.write(obj: dbOperation.generateObject(key:"\(count)"))
        }
        
        return Util.nanoToMilli(ns: Util.getMachTimeInNano(startTime: time, endTime: mach_absolute_time()))
    }
    
    public func writeBatch() -> UInt64 {
        let time = mach_absolute_time()
        var objects = [Any]()
        for count in 1..<iterations {
            let obj = dbOperation.generateObject(key:"\(count)")
            if(count % batchSize == 0) {
                dbOperation.writeBatch(objs: objects);
                objects.removeAll()
            } else {
                objects.append(obj)
            }
        }
        
        if(objects.count > 0) {
            dbOperation.writeBatch(objs: objects);
            objects.removeAll()
        }
        
        return Util.nanoToMilli(ns: Util.getMachTimeInNano(startTime: time, endTime: mach_absolute_time()))
    }
    
    
    public func readAll() -> UInt64 {
        let time = mach_absolute_time()
        for count in 1..<iterations {
            dbOperation.read(key: "\(count)")
        }
        return Util.nanoToMilli(ns: Util.getMachTimeInNano(startTime: time, endTime: mach_absolute_time()))
    }
    
    
    public func updateAll() -> UInt64 {
        let time = mach_absolute_time()
        for count in 1..<iterations {
            dbOperation.update(key: "\(count)")
        }
        return Util.nanoToMilli(ns: Util.getMachTimeInNano(startTime: time, endTime: mach_absolute_time()))
    }
    
    public func updateBatch() -> UInt64 {
        let time = mach_absolute_time()
        var keys: [String] = [String]()
        for count in 1..<iterations {
            if(count % batchSize == 0) {
                dbOperation.updateBatch(keys: keys)
                keys.removeAll()
            } else {
                keys.append("\(count)")
            }
        }
        
        if(keys.count > 0) {
            dbOperation.updateBatch(keys: keys);
            keys.removeAll()
        }
        
        return Util.nanoToMilli(ns: Util.getMachTimeInNano(startTime: time, endTime: mach_absolute_time()))
    }
}
