// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "TrackableScrollView",
    platforms: [
        .iOS(.v14) // SwiftUI 지원 시작 버전
    ],
    products: [
        .library(
            name: "TrackableScrollView",
            targets: ["TrackableScrollView"]
        ),
    ],
    targets: [
        .target(
            name: "TrackableScrollView",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "TrackableScrollViewTests",
            dependencies: ["TrackableScrollView"],
            path: "Tests"
        ),
    ]
)
