import Csynthizer
public class BiquadConfig {
    var config: syz_BiquadConfig
    init() throws {
        config = syz_BiquadConfig()
        try CHECKED(syz_biquadDesignIdentity(&config))
    }
}