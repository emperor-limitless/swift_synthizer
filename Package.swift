// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var libname: String = "synthizer"
#if os(Linux)
    libname = "libsynthizer"
#elseif os(macOS)
    libname = "synthizer"
#endif
let package = Package(
    name: "synthizer",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "swift_synthizer",
            type: .dynamic,
            targets: ["synthizer"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .systemLibrary (
            name: "Csynthizer"),
        .target(
            name: "synthizer",
            dependencies: ["Csynthizer"], linkerSettings: [.linkedLibrary(libname)]),
    ]
)
