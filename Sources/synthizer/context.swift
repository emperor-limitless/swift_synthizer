import Csynthizer
public class Context: Pausable {
    public lazy var gain = DoubleProperty(self, Properties.GAIN.rawValue)
    public lazy var defaultDistanceRef = DoubleProperty(self, Properties.DEFAULT_DISTANCE_REF.rawValue)
    public lazy var defaultDistanceMax = DoubleProperty(self, Properties.DEFAULT_DISTANCE_MAX.rawValue)
    public lazy var defaultRolloff = DoubleProperty(self, Properties.DEFAULT_ROLLOFF.rawValue)
    public lazy var defaultClosenessBoost = DoubleProperty(self, Properties.DEFAULT_CLOSENESS_BOOST.rawValue)
    public lazy var defaultClosenessBoostDistance = DoubleProperty(self, Properties.DEFAULT_CLOSENESS_BOOST_DISTANCE.rawValue)
    public lazy var position = Double3Property(self, Properties.POSITION.rawValue)
    public lazy var orientation = Double6Property(self, Properties.ORIENTATION.rawValue)
    public lazy var defaultDistanceModel = IntProperty(instance: self, property: Properties.DEFAULT_DISTANCE_MODEL.rawValue)
    public lazy var defaultPannerStrategy = IntProperty(instance: self, property: Properties.DEFAULT_PANNER_STRATEGY.rawValue)
    public init() throws {
        var handle = syz_Handle()
        try CHECKED(syz_createContext(&handle, nil, nil))
        super.init(handle: handle)
    }
}