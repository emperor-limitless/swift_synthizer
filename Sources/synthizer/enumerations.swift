public enum SynthizerError: Error {
    case SynthizerERROR(String)
}
public enum LogLevel: UInt32 {
    case ERROR = 0
    case WARN = 10
    case INFO = 20
    case DEBUG = 30
}
public enum LoggingBackend: UInt32 {
    case NONE
    case STDERR
}
public enum ObjectType: UInt32 {
    case CONTEXT
    case BUFFER
    case BUFFER_GENERATOR
    case STREAMING_GENERATOR
    case NOISE_GENERATOR
    case DIRECT_SOURCE
    case ANGULAR_PANNED_SOURCE
    case SCALAR_PANNED_SOURCE
    case SOURCE_3D
    case GLOBAL_ECHO
    case GLOBAL_FDN_REVERB
    case STREAM_HANDLE
    case AUTOMATION_BATCH
    case FAST_SINE_BANK_GENERATOR
}

public enum PannerStrategy: Int32 {
    case DELEGATE
    case HRTF
    case STEREO
    case COUNT
}

/*
 * Distance models modeled after the WebAudio spec.
 * */
public enum DistanceModel: UInt32 {
    case NONE
    case LINEAR
    case EXPONENTIAL
    case INVERSE
    case COUNT
}

public enum NoiseType: UInt32 {
    case UNIFORM
    case VM
    case FILTERED_BROWN
    case COUNT
}

public enum Properties: Int32 {
    case AZIMUTH
    case BUFFER
    case ELEVATION
    case GAIN
    case DEFAULT_PANNER_STRATEGY
    case PANNING_SCALAR
    case PLAYBACK_POSITION
    case POSITION
    case ORIENTATION
    case CLOSENESS_BOOST
    case CLOSENESS_BOOST_DISTANCE
    case DISTANCE_MAX
    case DISTANCE_MODEL
    case DISTANCE_REF
    case ROLLOFF
    case DEFAULT_CLOSENESS_BOOST
    case DEFAULT_CLOSENESS_BOOST_DISTANCE
    case DEFAULT_DISTANCE_MAX
    case DEFAULT_DISTANCE_MODEL
    case DEFAULT_DISTANCE_REF
    case DEFAULT_ROLLOFF
    case LOOPING
    case NOISE_TYPE
    case PITCH_BEND
    case INPUT_FILTER_ENABLED
    case INPUT_FILTER_CUTOFF
    case MEAN_FREE_PATH
    case T60
    case LATE_REFLECTIONS_LF_ROLLOFF
    case LATE_REFLECTIONS_LF_REFERENCE
    case LATE_REFLECTIONS_HF_ROLLOFF
    case LATE_REFLECTIONS_HF_REFERENCE
    case LATE_REFLECTIONS_DIFFUSION
    case LATE_REFLECTIONS_MODULATION_DEPTH
    case LATE_REFLECTIONS_MODULATION_FREQUENCY
    case LATE_REFLECTIONS_DELAY
    case FILTER
    case FILTER_DIRECT
    case FILTER_EFFECTS
    case FILTER_INPUT
    case CURRENT_TIME
    case SUGGESTED_AUTOMATION_TIME
    case FREQUENCY
}

public enum EventTypes: UInt32 {
    case INVALID
    case LOOPED
    case FINISHED
    case USER_AUTOMATION
}

public enum InterpolationTypes: UInt32 {
    case NONE
    case LINEAR
}

public enum AutomationCommands: UInt32 {
    case _APPEND_PROPERTY
    case _SEND_USER_EVENT
    case _CLEAR_PROPERTY
    case _CLEAR_EVENTS
    case _CLEAR_ALL_PROPERTIES
}
