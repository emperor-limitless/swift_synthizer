import Csynthizer
import Foundation
public class Generator: Pausable {
    public lazy var gain = DoubleProperty(self, Properties.GAIN.rawValue)
    public lazy var pitchBend = DoubleProperty(self, Properties.PITCH_BEND.rawValue)
}

public class StreamingGenerator: Generator {
    public lazy var looping = BoolProperty(instance: self, property: Properties.LOOPING.rawValue)
    public lazy var playbackPosition = DoubleProperty(self, Properties.PLAYBACK_POSITION.rawValue)
    public static func fromFile(path: String, context ctx: Context) throws -> StreamingGenerator {
        var out = syz_Handle()
        try CHECKED(syz_createStreamingGeneratorFromFile(&out, ctx.getHandle(), path, nil, nil, nil))
        return StreamingGenerator(handle: out)
    }
    public static func fromStreamHandle(context ctx: Context, stream: StreamHandle) throws -> StreamingGenerator {
        var handle = syz_Handle()
        try CHECKED(syz_createStreamingGeneratorFromStreamHandle(&handle, ctx.handle, stream.handle, nil, nil, nil))
        return StreamingGenerator(handle: handle)
    }
}
public class BufferGenerator: Generator {
    public lazy var looping = BoolProperty(instance: self, property: Properties.LOOPING.rawValue)
    public lazy var buffer = ObjectProperty(self, Properties.BUFFER.rawValue)
    public lazy var playbackPosition = DoubleProperty(self, Properties.PLAYBACK_POSITION.rawValue)
    public init(context ctx: Context) throws {
        var handle = syz_Handle()
        try CHECKED(syz_createBufferGenerator(&handle, ctx.handle, nil, nil, nil))
        super.init(handle: handle)
    }
}