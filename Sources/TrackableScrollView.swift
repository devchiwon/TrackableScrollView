//
//  TrackableScrollView.swift
//  TrackableScrollView
//
//  Created by DevChiwon on 4/29/25.
//

import SwiftUI

public struct TrackableScrollView<Content: View>: View {
    private let content: Content
    private let axis: Axis.Set
    private let showsIndicators: Bool
    private let onScroll: (CGFloat) -> Void
    private let onReachBottom: () -> Void
    private let bottomThreshold: CGFloat

    @State private var contentHeight: CGFloat = 0
    @State private var scrollOffset: CGFloat = 0
    @State private var scrollViewHeight: CGFloat = 0

    public init(
        axis: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        bottomThreshold: CGFloat = 100,
        onScroll: @escaping (CGFloat) -> Void = { _ in },
        onReachBottom: @escaping () -> Void = {},
        @ViewBuilder content: () -> Content
    ) {
        self.axis = axis
        self.showsIndicators = showsIndicators
        self.bottomThreshold = bottomThreshold
        self.onScroll = onScroll
        self.onReachBottom = onReachBottom
        self.content = content()
    }

    public var body: some View {
        ScrollViewReader { proxy in
            ScrollView(axis, showsIndicators: showsIndicators) {
                VStack(spacing: 0) {
                    GeometryReader { geo in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .named("scroll")).minY)
                            .onChange(of: geo.frame(in: .named("scroll")).minY) { newValue in
                                DispatchQueue.main.async {
                                    self.scrollOffset = newValue
                                    self.onScroll(newValue)
                                    
                                    let remainingDistance = contentHeight - (scrollViewHeight + abs(newValue))
                                    if remainingDistance <= bottomThreshold {
                                        self.onReachBottom()
                                    }
                                }
                            }
                    }
                    .frame(height: 0)

                    content
                        .background(
                            GeometryReader { geo -> Color in
                                DispatchQueue.main.async {
                                    self.contentHeight = geo.size.height
                                }
                                return Color.clear
                            }
                        )
                }
            }
            .coordinateSpace(name: "scroll")
            .background(
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        self.scrollViewHeight = geo.size.height
                    }
                    return Color.clear
                }
            )
        }
    }
}
