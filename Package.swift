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
        .package(url: "https://github.com/nextbillion-ai/maps-ios-distribution", exact: "2.4.0-beta.6"),
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
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0-beta.4/navigation.xcframework.zip",
            checksum: "d70378709df95b8c8f2a28c7c3ae6b1231202b7578cbdcf8e82db6a08dc2756d"
        ),
        .binaryTarget(
            name: "NbmapCoreNavigation",
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0-beta.4/navigation-core.xcframework.zip",
            checksum: "1cd47bff19e683e69a5c6d791300fd3ce906fdc41052672ca641aedbb7725d7e"
        )
    ]
)
