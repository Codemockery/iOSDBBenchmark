// Generated using the ObjectBox Swift Generator — https://objectbox.io
// DO NOT EDIT

// swiftlint:disable all
import ObjectBox
import Foundation

// MARK: - Entity metadata


extension LEResponseBoxModel: ObjectBox.__EntityRelatable {
    internal typealias EntityType = LEResponseBoxModel

    internal var _id: EntityId<LEResponseBoxModel> {
        return EntityId<LEResponseBoxModel>(self.id.value)
    }
}

extension LEResponseBoxModel: ObjectBox.EntityInspectable {
    internal typealias EntityBindingType = LEResponseBoxModelBinding

    /// Generated metadata used by ObjectBox to persist the entity.
    internal static var entityInfo = ObjectBox.EntityInfo(name: "LEResponseBoxModel", id: 2)

    internal static var entityBinding = EntityBindingType()

    fileprivate static func buildEntity(modelBuilder: ObjectBox.ModelBuilder) throws {
        let entityBuilder = try modelBuilder.entityBuilder(for: LEResponseBoxModel.self, id: 2, uid: 7121647250196211968)
        try entityBuilder.addProperty(name: "id", type: PropertyType.long, flags: [.id], id: 1, uid: 6740379170961203456)
        try entityBuilder.addProperty(name: "response", type: PropertyType.string, id: 2, uid: 154127494155965696)
        try entityBuilder.addProperty(name: "name", type: PropertyType.string, id: 3, uid: 2087616045916188928)
        try entityBuilder.addProperty(name: "test", type: PropertyType.long, id: 4, uid: 5730172566784208384)

        try entityBuilder.lastProperty(id: 4, uid: 5730172566784208384)
    }
}

extension LEResponseBoxModel {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { LEResponseBoxModel.id == myId }
    internal static var id: Property<LEResponseBoxModel, Id, Id> { return Property<LEResponseBoxModel, Id, Id>(propertyId: 1, isPrimaryKey: true) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { LEResponseBoxModel.response.startsWith("X") }
    internal static var response: Property<LEResponseBoxModel, String?, Void> { return Property<LEResponseBoxModel, String?, Void>(propertyId: 2, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { LEResponseBoxModel.name.startsWith("X") }
    internal static var name: Property<LEResponseBoxModel, String?, Void> { return Property<LEResponseBoxModel, String?, Void>(propertyId: 3, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { LEResponseBoxModel.test > 1234 }
    internal static var test: Property<LEResponseBoxModel, Int, Void> { return Property<LEResponseBoxModel, Int, Void>(propertyId: 4, isPrimaryKey: false) }

    fileprivate func __setId(identifier: ObjectBox.Id) {
        self.id = Id(identifier)
    }
}

extension ObjectBox.Property where E == LEResponseBoxModel {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .id == myId }

    internal static var id: Property<LEResponseBoxModel, Id, Id> { return Property<LEResponseBoxModel, Id, Id>(propertyId: 1, isPrimaryKey: true) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .response.startsWith("X") }

    internal static var response: Property<LEResponseBoxModel, String?, Void> { return Property<LEResponseBoxModel, String?, Void>(propertyId: 2, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .name.startsWith("X") }

    internal static var name: Property<LEResponseBoxModel, String?, Void> { return Property<LEResponseBoxModel, String?, Void>(propertyId: 3, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .test > 1234 }

    internal static var test: Property<LEResponseBoxModel, Int, Void> { return Property<LEResponseBoxModel, Int, Void>(propertyId: 4, isPrimaryKey: false) }

}


/// Generated service type to handle persisting and reading entity data. Exposed through `LEResponseBoxModel.EntityBindingType`.
internal class LEResponseBoxModelBinding: ObjectBox.EntityBinding {
    internal typealias EntityType = LEResponseBoxModel
    internal typealias IdType = Id

    internal required init() {}

    internal func generatorBindingVersion() -> Int { 1 }

    internal func setEntityIdUnlessStruct(of entity: EntityType, to entityId: ObjectBox.Id) {
        entity.__setId(identifier: entityId)
    }

    internal func entityId(of entity: EntityType) -> ObjectBox.Id {
        return entity.id.value
    }

    internal func collect(fromEntity entity: EntityType, id: ObjectBox.Id,
                                  propertyCollector: ObjectBox.FlatBufferBuilder, store: ObjectBox.Store) throws {
        let propertyOffset_response = propertyCollector.prepare(string: entity.response)
        let propertyOffset_name = propertyCollector.prepare(string: entity.name)

        propertyCollector.collect(id, at: 2 + 2 * 1)
        propertyCollector.collect(entity.test, at: 2 + 2 * 4)
        propertyCollector.collect(dataOffset: propertyOffset_response, at: 2 + 2 * 2)
        propertyCollector.collect(dataOffset: propertyOffset_name, at: 2 + 2 * 3)
    }

    internal func createEntity(entityReader: ObjectBox.FlatBufferReader, store: ObjectBox.Store) -> EntityType {
        let entity = LEResponseBoxModel()

        entity.id = entityReader.read(at: 2 + 2 * 1)
        entity.response = entityReader.read(at: 2 + 2 * 2)
        entity.name = entityReader.read(at: 2 + 2 * 3)
        entity.test = entityReader.read(at: 2 + 2 * 4)

        return entity
    }
}



extension Person: ObjectBox.__EntityRelatable {
    internal typealias EntityType = Person

    internal var _id: EntityId<Person> {
        return EntityId<Person>(self.id.value)
    }
}

extension Person: ObjectBox.EntityInspectable {
    internal typealias EntityBindingType = PersonBinding

    /// Generated metadata used by ObjectBox to persist the entity.
    internal static var entityInfo = ObjectBox.EntityInfo(name: "Person", id: 1)

    internal static var entityBinding = EntityBindingType()

    fileprivate static func buildEntity(modelBuilder: ObjectBox.ModelBuilder) throws {
        let entityBuilder = try modelBuilder.entityBuilder(for: Person.self, id: 1, uid: 1207962397885202688)
        try entityBuilder.addProperty(name: "id", type: PropertyType.long, flags: [.id], id: 1, uid: 365049363396301568)
        try entityBuilder.addProperty(name: "name", type: PropertyType.string, id: 2, uid: 7392653118570842112)
        try entityBuilder.addProperty(name: "age", type: PropertyType.long, id: 3, uid: 3575081596754673408)

        try entityBuilder.lastProperty(id: 3, uid: 3575081596754673408)
    }
}

extension Person {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { Person.id == myId }
    internal static var id: Property<Person, Id, Id> { return Property<Person, Id, Id>(propertyId: 1, isPrimaryKey: true) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { Person.name.startsWith("X") }
    internal static var name: Property<Person, String?, Void> { return Property<Person, String?, Void>(propertyId: 2, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { Person.age > 1234 }
    internal static var age: Property<Person, Int?, Void> { return Property<Person, Int?, Void>(propertyId: 3, isPrimaryKey: false) }

    fileprivate func __setId(identifier: ObjectBox.Id) {
        self.id = Id(identifier)
    }
}

extension ObjectBox.Property where E == Person {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .id == myId }

    internal static var id: Property<Person, Id, Id> { return Property<Person, Id, Id>(propertyId: 1, isPrimaryKey: true) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .name.startsWith("X") }

    internal static var name: Property<Person, String?, Void> { return Property<Person, String?, Void>(propertyId: 2, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .age > 1234 }

    internal static var age: Property<Person, Int?, Void> { return Property<Person, Int?, Void>(propertyId: 3, isPrimaryKey: false) }

}


/// Generated service type to handle persisting and reading entity data. Exposed through `Person.EntityBindingType`.
internal class PersonBinding: ObjectBox.EntityBinding {
    internal typealias EntityType = Person
    internal typealias IdType = Id

    internal required init() {}

    internal func generatorBindingVersion() -> Int { 1 }

    internal func setEntityIdUnlessStruct(of entity: EntityType, to entityId: ObjectBox.Id) {
        entity.__setId(identifier: entityId)
    }

    internal func entityId(of entity: EntityType) -> ObjectBox.Id {
        return entity.id.value
    }

    internal func collect(fromEntity entity: EntityType, id: ObjectBox.Id,
                                  propertyCollector: ObjectBox.FlatBufferBuilder, store: ObjectBox.Store) throws {
        let propertyOffset_name = propertyCollector.prepare(string: entity.name)

        propertyCollector.collect(id, at: 2 + 2 * 1)
        propertyCollector.collect(entity.age, at: 2 + 2 * 3)
        propertyCollector.collect(dataOffset: propertyOffset_name, at: 2 + 2 * 2)
    }

    internal func createEntity(entityReader: ObjectBox.FlatBufferReader, store: ObjectBox.Store) -> EntityType {
        let entity = Person()

        entity.id = entityReader.read(at: 2 + 2 * 1)
        entity.name = entityReader.read(at: 2 + 2 * 2)
        entity.age = entityReader.read(at: 2 + 2 * 3)

        return entity
    }
}


/// Helper function that allows calling Enum(rawValue: value) with a nil value, which will return nil.
fileprivate func optConstruct<T: RawRepresentable>(_ type: T.Type, rawValue: T.RawValue?) -> T? {
    guard let rawValue = rawValue else { return nil }
    return T(rawValue: rawValue)
}

// MARK: - Store setup

fileprivate func cModel() throws -> OpaquePointer {
    let modelBuilder = try ObjectBox.ModelBuilder()
    try LEResponseBoxModel.buildEntity(modelBuilder: modelBuilder)
    try Person.buildEntity(modelBuilder: modelBuilder)
    modelBuilder.lastEntity(id: 2, uid: 7121647250196211968)
    return modelBuilder.finish()
}

extension ObjectBox.Store {
    /// A store with a fully configured model. Created by the code generator with your model's metadata in place.
    ///
    /// - Parameters:
    ///   - directoryPath: The directory path in which ObjectBox places its database files for this store.
    ///   - maxDbSizeInKByte: Limit of on-disk space for the database files. Default is `1024 * 1024` (1 GiB).
    ///   - fileMode: UNIX-style bit mask used for the database files; default is `0o644`.
    ///     Note: directories become searchable if the "read" or "write" permission is set (e.g. 0640 becomes 0750).
    ///   - maxReaders: The maximum number of readers.
    ///     "Readers" are a finite resource for which we need to define a maximum number upfront.
    ///     The default value is enough for most apps and usually you can ignore it completely.
    ///     However, if you get the maxReadersExceeded error, you should verify your
    ///     threading. For each thread, ObjectBox uses multiple readers. Their number (per thread) depends
    ///     on number of types, relations, and usage patterns. Thus, if you are working with many threads
    ///     (e.g. in a server-like scenario), it can make sense to increase the maximum number of readers.
    ///     Note: The internal default is currently around 120.
    ///           So when hitting this limit, try values around 200-500.
    /// - important: This initializer is created by the code generator. If you only see the internal `init(model:...)`
    ///              initializer, trigger code generation by building your project.
    internal convenience init(directoryPath: String, maxDbSizeInKByte: UInt64 = 1024 * 1024,
                            fileMode: UInt32 = 0o644, maxReaders: UInt32 = 0, readOnly: Bool = false) throws {
        try self.init(
            model: try cModel(),
            directory: directoryPath,
            maxDbSizeInKByte: maxDbSizeInKByte,
            fileMode: fileMode,
            maxReaders: maxReaders,
            readOnly: readOnly)
    }
}

// swiftlint:enable all
