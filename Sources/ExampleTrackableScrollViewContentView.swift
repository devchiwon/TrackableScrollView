//
//  ExampleContent.swift
//  TrackableScrollView
//
//  Created by DevChiwon on 4/29/25.
//

import SwiftUI

struct ExampleTrackableScrollViewContentView: View {
    @State private var scrollPosition: CGFloat = 0
    @State private var loadMoreTriggered = false

    var body: some View {
        VStack {
            Text("Current Scroll Offset: \(scrollPosition)")
                .padding()

            TrackableScrollView(
                onScroll: { offset in
                    scrollPosition = offset
                },
                onReachBottom: {
                    if !loadMoreTriggered {
                        loadMoreTriggered = true
                        print("Reached Bottom!")
                    }
                }
            ) {
                VStack(spacing: 16) {
                    ForEach(0..<50) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.3))
                            .frame(height: 100)
                            .overlay(Text("Item \(index)").foregroundColor(.black))
                    }
                }
                .padding()
            }
        }
    }
}
