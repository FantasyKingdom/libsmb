// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libsmb",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "libsmb",
            targets: ["libsmb"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "libsmb",
            dependencies: [], cSettings: [
//                .headerSearchPath("lib"),
                .headerSearchPath("include"),
                .headerSearchPath("include/smb2"),
                .define("HAVE_CONFIG_H", to: "1"),
                .define("_U_", to: "__attribute__((unused))"),
                .define("HAVE_GETPWNAM", to: "1"),
                .define("HAVE_SOCKADDR_LEN", to: "1"),
                .define("HAVE_SOCKADDR_STORAGE", to: "1"),
                .define("HAVE_TALLOC_TEVENT", to: "1")
            ]),
        .testTarget(
            name: "libsmb2Tests",
            dependencies: ["libsmb"]),
    ]
)
