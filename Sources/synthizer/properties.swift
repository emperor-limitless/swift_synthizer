import Csynthizer
// This is where all properties go.

// None of this should be used by the user manually, So it's set to access level internal.

// We're using classes instead of structs because of inheritence.
// The main property that all the properties will inherit from.

public class PropertyBase {
    var instance: BaseObject
    var property: Int32
    init(_ instance: BaseObject, _ property: Int32) {
        self.instance = instance
        self.property = property
    }
    func getHandleChecked() throws -> UInt64 {
        let handle = instance.getHandle()
        if handle == 0 {
            throw SynthizerError.SynthizerERROR("Object no longer exists.")
        }
        return handle
    }
}
public class IntProperty: PropertyBase {
    init(instance: BaseObject, property: Int32) {
        super.init(instance, property)
    }
    // We're using methods for getters and setters instead of the actual implementation of swift's getters and setters so we can throw errors.
    // Swift's getters can throw, But setters can't.
    public func get() throws -> Int32 {
        var val: Int32 = 0
        let handle = try getHandleChecked()
        try CHECKED(syz_getI(&val, handle, property))
        return val
    }
    public func set(_ value: Int32) throws {
        let handle = try getHandleChecked()
        try CHECKED(syz_setI(handle, self.property, value))
    }
}
public class BoolProperty: PropertyBase {
    init(instance: BaseObject, property: Int32) {
        super.init(instance, property)
    }
    public func get() throws -> Bool {
        var val: Int32 = 0
        let handle = try getHandleChecked()
        try CHECKED(syz_getI(&val, handle, property))
        return val == 1
    }
    public func set(_ value: Bool) throws {
        let handle = try getHandleChecked()
        try CHECKED(syz_setI(handle, self.property, value ? 1 : 0))
    }
}

public class DoubleProperty: PropertyBase {
    public func get() throws -> Double {
        var val: Double = 0.0
        let handle = try getHandleChecked()
        try CHECKED(syz_getD(&val, handle, property))
        return val
    }
    public func set(_ value: Double) throws {
        let handle = try getHandleChecked()
        try CHECKED(syz_setD(handle, property, value))
    }
}
public class Double3Property: PropertyBase {
    // This returns a tuple of the coordinates. OF course, IF it didn't fail.
    public func get() throws -> (Double, Double, Double) {
        var pos = (x: 0.0, y: 0.0, z: 0.0)
        let handle = try getHandleChecked()
        try CHECKED(syz_getD3(&pos.x, &pos.y, &pos.z, handle, property))
        return pos
    }
    public func set(_ pos: (Double, Double, Double)) throws {
        let handle = try getHandleChecked()
        try CHECKED(syz_setD3(handle, property, pos.0, pos.1, pos.2))
    }
}
public class Double6Property: PropertyBase {
    public func get() throws -> (Double, Double, Double, Double, Double, Double) {
        var pos = (x1: 0.0, y1: 0.0, z1: 0.0, x2: 0.0, y2: 0.0, z2: 0.0)
        let handle = try getHandleChecked()
        try CHECKED(syz_getD6(&pos.x1, &pos.y1, &pos.z1, &pos.x2, &pos.y2, &pos.z2, handle, property))
        return pos
    }
    public func set(_ pos: (Double, Double, Double, Double, Double, Double)) throws {
        let handle = try getHandleChecked()
        try CHECKED(syz_setD6(handle, property, pos.0, pos.1, pos.2, pos.3, pos.4, pos.5))
    }
}
public class ObjectProperty: PropertyBase {
    public func set(_ value: BaseObject) throws {
        let handle = try getHandleChecked()
        try CHECKED(syz_setO(handle, property, value.handle))
    }
}