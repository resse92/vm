//
//  Bytes.swift
//  LuaImplementation
//
//  Created by AlexZHU on 2019/10/18.
//  Copyright © 2019 AlexZHU. All rights reserved.
//
typealias Byte = UInt8
public final class Bytes {
    
    /// The position from which new export operations begin.
    public var position = 0
    /// The underlying UInt8 array
    public var data: [UInt8]
    
    /// Indicates the number of bytes which may be successfully exported
    public var availableExportBytes: Int { return data.count - position }
    
    /// Create an empty Bytes object
    public init() {
        data = [UInt8]()
    }
    
    /// Initialize with existing bytes
    public init(existingBytes: [UInt8]) {
        data = existingBytes
    }
    
    // -- IMPORT
    /// Imports one UInt8 value appending it to the end of the array
    /// - returns: The Bytes object
    @discardableResult
    public func import8Bits(from frm: UInt8) -> Bytes {
        data.append(frm)
        return self
    }
    
    /// Imports one UInt16 value appending it to the end of the array
    /// - returns: The Bytes object
    @discardableResult
    public func import16Bits(from frm: UInt16) -> Bytes {
        data.append(UInt8(frm & 0xFF))
        data.append(UInt8((frm >> 8) & 0xFF))
        return self
    }
    
    /// Imports one UInt32 value appending it to the end of the array
    /// - returns: The Bytes object
    @discardableResult
    public func import32Bits(from frm: UInt32) -> Bytes {
        data.append(UInt8(frm & 0xFF))
        data.append(UInt8((frm >> 8) & 0xFF))
        data.append(UInt8((frm >> 16) & 0xFF))
        data.append(UInt8((frm >> 24) & 0xFF))
        return self
    }
    
    /// Imports one UInt64 value appending it to the end of the array
    /// - returns: The Bytes object
    @discardableResult
    public func import64Bits(from frm: UInt64) -> Bytes {
        data.append(UInt8(frm & 0xFF))
        data.append(UInt8((frm >> 8) & 0xFF))
        data.append(UInt8((frm >> 16) & 0xFF))
        data.append(UInt8((frm >> 24) & 0xFF))
        data.append(UInt8((frm >> 32) & 0xFF))
        data.append(UInt8((frm >> 40) & 0xFF))
        data.append(UInt8((frm >> 48) & 0xFF))
        data.append(UInt8((frm >> 56) & 0xFF))
        return self
    }
    
    /// Imports an array of UInt8 values appending them to the end of the array
    /// - returns: The Bytes object
    @discardableResult
    public func importBytes(from frm: [UInt8]) -> Bytes {
        data.append(contentsOf: frm)
        return self
    }
    
    /// Imports the array values of the given Bytes appending them to the end of the array
    /// - returns: The Bytes object
    @discardableResult
    public func importBytes(from frm: Bytes) -> Bytes {
        data.append(contentsOf: frm.data)
        return self
    }
    
    /// Imports an `ArraySlice` of UInt8 values appending them to the end of the array
    /// - returns: The Bytes object
    @discardableResult
    public func importBytes(from frm: ArraySlice<UInt8>) -> Bytes {
        data.append(contentsOf: frm)
        return self
    }
    
    // -- EXPORT
    
    /// Exports one UInt8 from the current position. Advances the position marker by 1 byte.
    /// - returns: The UInt8 value
    public func export8Bits() -> UInt8 {
        let result = data[position]
        position += 1
        return result
    }
    
    /// Exports one UInt16 from the current position. Advances the position marker by 2 bytes.
    /// - returns: The UInt16 value
    public func export16Bits() -> UInt16 {
        
        let one = UInt16(data[position])
        position += 1
        let two = UInt16(data[position])
        position += 1
        
        return (two << 8) + one
    }
    
    /// Exports one UInt32 from the current position. Advances the position marker by 4 bytes.
    /// - returns: The UInt32 value
    public func export32Bits() -> UInt32 {
        let one = UInt32(data[position])
        position += 1
        let two = UInt32(data[position])
        position += 1
        let three = UInt32(data[position])
        position += 1
        let four = UInt32(data[position])
        position += 1
        
        return (four << 24) + (three << 16) + (two << 8) + one
    }
    
    /// Exports one UInt64 from the current position. Advances the position marker by 8 bytes.
    /// - returns: The UInt64 value
    public func export64Bits() -> UInt64 {
        let one = UInt64(data[position])
        position += 1
        let two = UInt64(data[position]) << 8
        position += 1
        let three = UInt64(data[position]) << 16
        position += 1
        let four = UInt64(data[position]) << 24
        position += 1
        let five = UInt64(data[position]) << 32
        position += 1
        let six = UInt64(data[position]) << 40
        position += 1
        let seven = UInt64(data[position]) << 48
        position += 1
        let eight = UInt64(data[position]) << 56
        position += 1
        
        return (one+two+three+four)+(five+six+seven+eight)
    }
    
    /// Exports the indicated number of bytes
    public func exportBytes(count cnt: Int) -> [UInt8] {
        var sub = [UInt8]()
        let end = position + cnt
        while position < end {
            sub.append(data[position])
            position += 1
        }
        return sub
    }
}
