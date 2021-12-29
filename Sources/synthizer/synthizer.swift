import Csynthizer
import Foundation

public func initialize(log_level: LogLevel? = nil, logging_backend: LoggingBackend? = nil, libsndfile_path: String? = nil) throws {
    guard let logl = log_level, let logb = logging_backend else {
        try CHECKED(syz_initialize())
        return
    }
    if let path = libsndfile_path {
        try path.withCString { ptr in
            var config = syz_LibraryConfig(log_level: logl.rawValue, logging_backend: logb.rawValue, libsndfile_path: ptr)
            try CHECKED(syz_initializeWithConfig(&config))
        }
    } else {
        var config = syz_LibraryConfig(log_level: logl.rawValue, logging_backend: logb.rawValue, libsndfile_path: nil)
        try CHECKED(syz_initializeWithConfig(&config))
    }
}
public func shutdown() throws {
    try CHECKED(syz_shutdown())
}