// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "navigation-ios",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "NbmapNavigation",
            targets: ["NbmapNavigationDependencies"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/nextbillion-ai/maps-ios-distribution", exact: "2.4.0"),
        .package(url: "https://github.com/nextbillion-ai/turf-distribution", exact: "3.0.1")
    ],
    targets: [
        .target(
            name: "NbmapNavigationDependencies",
            dependencies: [
                "NbmapNavigation",
                "NbmapCoreNavigation",
                .product(name: "Nbmap", package: "maps-ios-distribution"),
                .product(name: "NBTurf", package: "turf-distribution")
            ]
        ),
        .binaryTarget(
            name: "NbmapNavigation",
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0/navigation.xcframework.zip",
            checksum: "cf149e99ff157bd99a9380f89568a57e61d74226bc526badfd1acb0e4bb3b6f4"
        ),
        .binaryTarget(
            name: "NbmapCoreNavigation",
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0/navigation-core.xcframework.zip",
            checksum: "5a4769e246e6f37e2c76bbaf04e8064b3523320b63e20c7556334f4e9675782b"
        )
    ]
)
