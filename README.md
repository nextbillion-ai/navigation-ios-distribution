# NextBillion.ai Navigation iOS SDK

Binary distribution of the NextBillion.ai Navigation SDK for iOS, for Swift Package Manager and Carthage.

- Minimum iOS version: 13.0
- Modules: `import NbmapNavigation` (UI) and `import NbmapCoreNavigation` (routing and guidance)
- Depends on the [NextBillion.ai Maps iOS SDK](https://github.com/nextbillion-ai/maps-ios-distribution) (`Nbmap`) and [Turf](https://github.com/nextbillion-ai/turf-distribution) (`NBTurf`). Each release states the exact versions it was built and tested with.
- Releases: https://github.com/nextbillion-ai/navigation-ios-distribution/releases

Versions with an `-alpha.N`, `-beta.N` or `-rc.N` suffix are prereleases for testing. Swift Package Manager and Carthage only use them when you request that exact version.

## Swift Package Manager

In Xcode, choose **File > Add Package Dependencies...**, enter

```
https://github.com/nextbillion-ai/navigation-ios-distribution
```

and add the **NbmapNavigation** library to your target. The Maps SDK and Turf are added automatically at the matching versions.

In a `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/nextbillion-ai/navigation-ios-distribution", from: "4.2.0")
],
targets: [
    .target(name: "YourTarget", dependencies: [
        .product(name: "NbmapNavigation", package: "navigation-ios-distribution")
    ])
]
```

If your app also uses the Maps SDK directly, keep depending on `maps-ios-distribution` as usual; Swift Package Manager uses the one version both packages agree on.

## Carthage

Carthage does not install the dependencies of binary frameworks, so list all four in your `Cartfile`. Use the Maps and Turf versions given in the release notes of the navigation version you choose:

```
binary "https://github.com/nextbillion-ai/maps-ios-distribution/releases/download/carthage/maps.json" == <maps version>
binary "https://github.com/nextbillion-ai/nextbillion-turf-ios/releases/download/v1/carthage/Turf.json" == <turf version>
binary "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/carthage/navigation-core.json" ~> 4.2
binary "https://github.com/nextbillion-ai/navigation-ios-distribution/releases/download/carthage/navigation.json" ~> 4.2
```

Then run `carthage update --use-xcframeworks --platform iOS` and add `Nbmap.xcframework`, `Turf.xcframework`, `NbmapCoreNavigation.xcframework` and `NbmapNavigation.xcframework` from `Carthage/Build` to your target (Embed & Sign).

## Manual

Download `navigation.xcframework.zip` and `navigation-core.xcframework.zip` from a release, plus the matching Maps and Turf releases. Unzip them and add `NbmapNavigation.xcframework`, `NbmapCoreNavigation.xcframework`, `Nbmap.xcframework` and `Turf.xcframework` to your target (Embed & Sign). Each release also includes `navigation.dSYMs.zip` with debug symbols for crash symbolication.
