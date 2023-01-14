// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Crew",
    products: [
        .library(name: "Crew", targets: ["Crew"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "Crew",
            dependencies: [
                "CLib"
            ]
        ),
        .target(
            name: "CLib",
            dependencies: []
        ),
        .testTarget(
            name: "CrewTests",
            dependencies: ["Crew"]
        ),
    ]
)
