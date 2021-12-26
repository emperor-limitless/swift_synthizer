import Csynthizer
public class Source: Pausable {
    public lazy var gain = DoubleProperty(self, Properties.GAIN.rawValue)
    public func addGenerator(_ gen: Generator) throws {
        try CHECKED(syz_sourceAddGenerator(handle, gen.handle))
    }
    public func removeGenerator(_ gen: Generator) throws {
        try CHECKED(syz_sourceRemoveGenerator(handle, gen.handle))
    }
}
public class DirectSource: Source {
    public init(context ctx: Context) throws {
        var out = syz_Handle()
        try CHECKED(syz_createDirectSource(&out, ctx.handle, nil, nil, nil))
        super.init(handle: out)
    }
}
public class AngularPannedSource: Source {
    public lazy var azimuth = DoubleProperty(self, Properties.AZIMUTH.rawValue)
    public lazy var elevation = DoubleProperty(self, Properties.ELEVATION.rawValue)
    public init(context: Context, pannerStrategy: PannerStrategy = PannerStrategy.DELEGATE, azimuth: Double = 0.0, elevation: Double = 0.0) throws {
        var out = syz_Handle()
        try CHECKED(syz_createAngularPannedSource(&out, context.handle, pannerStrategy.rawValue, azimuth, elevation, nil, nil, nil))
        super.init(handle: out)
    }
}
public class ScalarPannedSource: Source {
    public lazy var panningScalar = DoubleProperty(self, Properties.PANNING_SCALAR.rawValue)
    public init(context: Context, pannerStrategy: PannerStrategy = PannerStrategy.DELEGATE, panningScalar: Double = 0.0) throws {
        var out = syz_Handle()
        try CHECKED(syz_createScalarPannedSource(&out, context.handle, pannerStrategy.rawValue, panningScalar, nil, nil, nil))
        super.init(handle: out)
    }
}
public class Source3D: Source {
    public lazy var distanceRef = DoubleProperty(self, Properties.DISTANCE_REF.rawValue)
    public lazy var distanceMax = DoubleProperty(self, Properties.DISTANCE_MAX.rawValue)
    public lazy var rolloff = DoubleProperty(self, Properties.ROLLOFF.rawValue)
    public lazy var closenessBoost = DoubleProperty(self, Properties.CLOSENESS_BOOST.rawValue)
    public lazy var closenessBoostDistance = DoubleProperty(self, Properties.CLOSENESS_BOOST_DISTANCE.rawValue)
    public lazy var position = Double3Property(self, Properties.POSITION.rawValue)
    public lazy var orientation = Double6Property(self, Properties.ORIENTATION.rawValue)
    public lazy var distanceModel = IntProperty(instance: self, property: Properties.DISTANCE_MODEL.rawValue)
    public init(context: Context, pannerStrategy: PannerStrategy = PannerStrategy.DELEGATE, position: (Double, Double, Double) = (0.0, 0.0, 0.0)) throws {
        var out = syz_Handle()
        try CHECKED(syz_createSource3D(&out, context.handle, pannerStrategy.rawValue, position.0, position.1, position.2, nil, nil, nil))
        super.init(handle: out)
    }
}