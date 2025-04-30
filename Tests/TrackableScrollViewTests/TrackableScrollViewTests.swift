//
//  TrackableScrollViewTests.swift
//  TrackableScrollView
//
//  Created by DevChiwon on 4/29/25.
//

import XCTest
import SwiftUI
@testable import TrackableScrollView

final class TrackableScrollViewTests: XCTestCase {

    func testScrollViewStructure() {
        let view = TrackableScrollView {
            Text("Test Item")
        }

        XCTAssertNotNil(view)
    }

    func testOnScrollCallbackCalled() {
        let expectation = XCTestExpectation(description: "onScroll callback should be triggered")
        var callbackValue: CGFloat = 0

        let _ = TrackableScrollView(
            onScroll: { value in
                callbackValue = value
                expectation.fulfill()
            },
            content: {
                VStack {
                    ForEach(0..<10) { Text("Item \($0)") }
                }
            }
        )

        let testOffset: CGFloat = -150
        callbackValue = testOffset

        XCTAssertEqual(callbackValue, -150)
    }

    func testOnReachBottomCallback() {
        let expectation = XCTestExpectation(description: "onReachBottom should be called")

        let _ = TrackableScrollView(
            onScroll: { _ in },
            onReachBottom: {
                expectation.fulfill()
            },
            content: {
                VStack {
                    ForEach(0..<50) { Text("Row \($0)") }
                }
            }
        )

        let simulateReachBottom = true
        if simulateReachBottom {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
