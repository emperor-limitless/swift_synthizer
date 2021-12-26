import Csynthizer
public func CHECKED(_ ret: syz_ErrorCode) throws {
    if ret > 0 {
        throw SynthizerError.SynthizerERROR("\(CCharToString(syz_getLastErrorMessage())) [\(ret)]")
    }
}
public func CCharToString(_ char: UnsafePointer<Int8>?) -> String {
        if let ch = char {
            let str = String(cString: ch)
            return str
        }
    return ""
}

public class BaseObject {
    var handle: UInt64
    init(handle: UInt64) {
        self.handle = handle
    }
    public func destroy() throws {
        try CHECKED(syz_handleDecRef(handle))
    }
    func getHandle() -> UInt64 {
        handle
    }
    public func configDeleteBehavior(linger: Bool, timeout: Double) throws {
        var cfg = syz_DeleteBehaviorConfig(linger: linger == true ? 1 : 0, linger_timeout: timeout)
        syz_initDeleteBehaviorConfig(&cfg)
        try CHECKED(syz_configDeleteBehavior(handle, &cfg))
    }
}
public class Pausable: BaseObject {
    public lazy var currentTime = DoubleProperty(self, Properties.CURRENT_TIME.rawValue)
    public lazy var suggestedAutomationTime = DoubleProperty(self, Properties.SUGGESTED_AUTOMATION_TIME.rawValue)
    override init(handle: UInt64) {
        super.init(handle: handle)
    }
    public func play() throws {
        try CHECKED(syz_play(handle))
    }
    public func pause() throws {
        try CHECKED(syz_pause(handle))
    }
}