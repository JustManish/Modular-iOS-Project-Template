// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let analyticsInterface = "AnalyticsInterface"
private let commonModels = "CommonModels"
private let dependencyContainer = "DependencyContainer"
private let artistDetailInterface = "ArtistDetailInterface"
private let songDetailsInterface = "SongDetailsInterface"
private let localisation = "Localisation"

let package = Package(
    name: "ArtistDetail",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ArtistDetail",
            targets: ["ArtistDetail"]),
    ],
    dependencies: [
        .package(name: analyticsInterface, path: "../../../Analytics/\(analyticsInterface)"),
        .package(name: commonModels, path: "../../../\(commonModels)"),
        .package(name: dependencyContainer, path: "../../../\(dependencyContainer)"),
        .package(name: artistDetailInterface, path: "../\(artistDetailInterface)"),
        .package(name: songDetailsInterface, path: "../../SongDetails/\(songDetailsInterface)"),
        .package(name: localisation, path: "../../../\(localisation)")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ArtistDetail",
            dependencies: [
                .product(name: analyticsInterface, package: analyticsInterface),
                .product(name: commonModels, package: commonModels),
                .product(name: dependencyContainer, package: dependencyContainer),
                .product(name: artistDetailInterface, package: artistDetailInterface),
                .product(name: songDetailsInterface, package: songDetailsInterface),
                .product(name: localisation, package: localisation)
            ]
        ),
        .testTarget(
            name: "ArtistDetailTests",
            dependencies: ["ArtistDetail"]),
    ]
)
