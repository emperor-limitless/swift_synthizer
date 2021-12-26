import Csynthizer
import Foundation
public class Buffer: BaseObject {
    public static func fromFile(path: String) throws -> Buffer {
        var handle = syz_Handle()
        try CHECKED(syz_createBufferFromFile(&handle, path, nil, nil))
        return Buffer(handle: handle)
    }
    public static func fromEncodedData(data: Data) throws -> Buffer {
        var handle = syz_Handle()
        let fbytes = (data as NSData).bytes.assumingMemoryBound(to: Int8.self)
        let length = UInt64(data.count)
        try CHECKED(syz_createBufferFromEncodedData(&handle, length, fbytes, nil, nil))
        return Buffer(handle: handle)
    }
    public static func fromStreamHandle(_ stream: StreamHandle) throws -> Buffer {
        var handle = syz_Handle()
        try CHECKED(syz_createBufferFromStreamHandle(&handle, stream.handle, nil, nil))
        return Buffer(handle: handle)
    }
    public func getChannels() throws -> UInt32 {
        var ret: UInt32 = 0
        try CHECKED(syz_bufferGetChannels(&ret, handle))
        return ret
    }
    public func getLengthInSamples() throws -> UInt32 {
        var ret: UInt32 = 0
        try CHECKED(syz_bufferGetLengthInSamples(&ret, handle))
        return ret
    }
    public func getLengthInSeconds() throws -> Double {
        var ret: Double = 0.0
        try CHECKED(syz_bufferGetLengthInSeconds(&ret, handle))
        return ret
    }
    public func getSizeInBytes() throws -> UInt64 {
        var ret: UInt64 = 0
        try CHECKED(syz_bufferGetSizeInBytes(&ret, handle))
        return ret
    }
}