//
//  OBJBLEResponseExecutor.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 17/01/23.
//

import Foundation
import ObjectBox

class OBJBLEResponseExecutor : DBTestable {
    typealias DBItemType = LEResponseBoxModel
    
    let store: Store? = Util.createBoxDB(name: "mydb")
    var leResponseBox: Box<DBItemType>?
    
    init() {
        if let _store = store {
            leResponseBox = _store.box(for: LEResponseBoxModel.self)
        }
    }
    
    private func _read(key: String) -> [LEResponseBoxModel]? {
        guard let _leResponseBox = leResponseBox else { return nil }
        var responseModel: [LEResponseBoxModel]?
        do {
            let query: Query<LEResponseBoxModel> = try _leResponseBox.query{ LEResponseBoxModel.name.isEqual(to: key, caseSensitive: true) }.build()
            responseModel = try query.find()
        } catch {
            responseModel = nil
        }
        return responseModel
    }
    
    func read(key: String) {
       _ = _read(key: key)
    }

    func write<DBItemType>(obj: DBItemType) {
        guard let _leResponseBox = leResponseBox else { return }

        if let _item = obj as? LEResponseBoxModel {
            do {
                try _leResponseBox.put(_item)
            } catch {
                
            }
        }
    }
    
    func writeBatch<DBItemType>(objs: [DBItemType]) {
        guard let _leResponseBox = leResponseBox else { return }
        
        if let _items = objs as? [LEResponseBoxModel] {
            do {
                try _leResponseBox.put(_items)
            } catch {
                
            }
        }
    }
    
    func update(key: String) {
        guard let _leResponseBox = leResponseBox else { return }

        let responseModels: [LEResponseBoxModel]? = _read(key: key)
        if let _responseModels = responseModels, _responseModels.count != 0 {
            if let responseModel = _responseModels.first {
                responseModel.test = 1
                do {
                    try _leResponseBox.put(responseModel)
                } catch {
                    
                }
            }
        }
    }
    
    func updateBatch(keys: [String]) {
        guard let _leResponseBox = leResponseBox else { return }

        var responseModelBatch: [LEResponseBoxModel] = [LEResponseBoxModel]()
        keys.forEach { key in
            let responseModels: [LEResponseBoxModel]? = _read(key: key)
            if let _responseModels = responseModels, _responseModels.count != 0 {
                if let responseModel = _responseModels.first {
                    responseModel.test = 1
                    responseModelBatch.append(responseModel)
                }
            }
        }
        
        do {
            try _leResponseBox.put(responseModelBatch)
        } catch {
            
        }
    }
    
    func delete(key: String) {
        
    }

    func generateObject(key: String) -> LEResponseBoxModel {
        let person = LEResponseBoxModel()
        person.name = key
        person.response = GenericSingleton.sharedInstance.getLEResponseString()
        person.test = 0
        return person
    }

}
