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
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0-beta.7/navigation.xcframework.zip",
            checksum: "a31516bed1239b41632bd3c69bfa6f8323988435979b22684f3ad7e1467faf5a"
        ),
        .binaryTarget(
            name: "NbmapCoreNavigation",
            url: "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/4.2.0-beta.7/navigation-core.xcframework.zip",
            checksum: "ffa382fda4eb75b68213de312f5b80dc2504b2b9b0821c95f5fb5f19365a9d6c"
        )
    ]
)
