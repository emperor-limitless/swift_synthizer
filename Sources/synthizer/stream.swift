import Csynthizer
import Foundation
public class StreamHandle: BaseObject {
    override required init(handle: UInt64) {
        super.init(handle: handle)
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
        let fbytes = (data as NSData).bytes.assumingMemoryBound(to: Int8.self)
        let length = UInt64(data.count)
        try CHECKED(syz_createStreamHandleFromMemory(&handle, length, fbytes, nil, nil))
        return self.init(handle: handle)
    }
}