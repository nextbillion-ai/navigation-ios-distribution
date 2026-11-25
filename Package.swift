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
        .package(url: "https://github.com/nextbillion-ai/maps-ios-distribution", exact: "2.4.0-beta.9"),
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
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0-beta.6/navigation.xcframework.zip",
            checksum: "180fe671e4b5fe7392494c3e0d37de752df3b8ccbbed58d9091530465c7b6a4b"
        ),
        .binaryTarget(
            name: "NbmapCoreNavigation",
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0-beta.6/navigation-core.xcframework.zip",
            checksum: "2d868371e63d28f6dd8997fbb5f7b8265f861c6a3004bd4bdeb6f73ee9ef7b08"
        )
    ]
)
