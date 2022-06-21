import Csynthizer
import Foundation
public class StreamHandle: BaseObject {
    var buf: UnsafeRawPointer?
    required init(handle: UInt64, buffer: UnsafeRawPointer? = nil) {
        super.init(handle: handle)
        buf = buffer
    }
    public static func fromFile(path: String) throws -> StreamHandle {
        var handle = syz_Handle()
        //let ph = (path as NSString).utf8String
        try path.withCString { ptr in
            try CHECKED(syz_createStreamHandleFromFile(&handle, ptr, nil, nil))
        }
        return self.init(handle: handle)
    }
    
    public static func fromMemory(data: Data) throws -> StreamHandle {
        var handle = syz_Handle()
        let fbytes = UnsafeMutablePointer<UInt8>.allocate(capacity: data.count)
        data.copyBytes(to: fbytes, count: data.count)
        let fb = UnsafeRawPointer(fbytes)
        let fby = fb.assumingMemoryBound(to: Int8.self)
        let length = UInt64(data.count)
        try CHECKED(syz_createStreamHandleFromMemory(&handle, length, fby, nil, nil))
        return self.init(handle: handle, buffer: fbytes)
    }
}