//
//  PersonTester.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 16/01/23.
//

import Foundation
import ObjectBox

class OBJBPersonExecutor : DBTestable {
    typealias DBItemType = Person
    
    let store: Store? = Util.createBoxDB(name: "mydb")
    var personBox: Box<DBItemType>?
    
    init() {
        if let _store = store {
            personBox = _store.box(for: Person.self)
        }
    }


    private func _read(key: String) -> [Person]? {
        guard let _personBox = personBox else { return nil }
        var person: [Person]?
        do {
            let query: Query<Person> = try _personBox.query{Person.name.isEqual(to: key, caseSensitive: true)}.build()
            person = try query.find()
        } catch {
            person = nil
        }
        return person
    }
    
    func read(key: String) {
       _ = _read(key: key)
    }

    func write<DBItemType>(obj: DBItemType) {
        guard let _personBox = personBox else { return }

        if let _item = obj as? Person {
            do {
                try _personBox.put(_item)
            } catch {
                
            }
        }
    }
    
    func writeBatch<DBItemType>(objs: [DBItemType]) {
        guard let _personBox = personBox else { return }
        
        if let _items = objs as? [Person] {
            do {
                try _personBox.put(_items)
            } catch {
                
            }
        }
    }
    
    func update(key: String) {
        guard let _personBox = personBox else { return }

        let persons: [Person]? = _read(key: key)
        if let _persons = persons, _persons.count != 0 {
            if let person = _persons.first {
                person.age = 2
                do {
                    try _personBox.put(person)
                } catch {
                    
                }
            }
        }
    }
    
    func updateBatch(keys: [String]) {
        guard let _personBox = personBox else { return }

        var personsBatch: [Person] = [Person]()
        keys.forEach { key in
            let persons: [Person]? = _read(key: key)
            if let _persons = persons, _persons.count != 0 {
                if let person = _persons.first {
                    person.age = 3
                    personsBatch.append(person)
                }
            }
        }
        
        do {
            try _personBox.put(personsBatch)
        } catch {
            
        }
    }
    
    func delete(key: String) {
        
    }

    func generateObject(key: String) -> Person {
        let person = Person()
        person.name = key
        person.age = 1
        return person
    }

}
