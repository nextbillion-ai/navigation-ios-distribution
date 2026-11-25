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
        .package(url: "https://github.com/nextbillion-ai/maps-ios-distribution", exact: "2.4.0-beta.8"),
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
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0-beta.5/navigation.xcframework.zip",
            checksum: "87564320c2d929d0bc5945d66fe2992640c47b29bcf79fa0f86e73a1db795d62"
        ),
        .binaryTarget(
            name: "NbmapCoreNavigation",
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0-beta.5/navigation-core.xcframework.zip",
            checksum: "bb4f94c5bc433b4db4c116694bae62b0f413e51232b31727833579e72cd4b827"
        )
    ]
)
