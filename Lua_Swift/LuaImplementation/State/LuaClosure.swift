//
//  LuaClosure.swift
//  LuaImplementation
//
//  Created by chenmu on 2019/11/7.
//  Copyright © 2019 AlexZHU. All rights reserved.
//

import Cocoa

struct LuaClosureUpvalue {
    let val: LuaValueConvertible
    
    init(val: inout LuaValueConvertible) {
        self.val = val
    }
    
    init(val: LuaValueConvertible) {
        self.val = val
    }
}

struct LuaClosure: LuaValueConvertible {
    private(set) var proto: Prototype! = nil // lua
    private(set) var swiftFunction: SwiftFunction! = nil // swift
    var upvalue: [LuaClosureUpvalue] = []
    var type: LuaType {
        return .function
    }
    
    init(_ f: @escaping SwiftFunction) {
        self.swiftFunction = f
    }
    
    init(proto: Prototype) {
        self.proto = proto
    }
}

