//
//  ScrollOffsetPreferenceKey.swift
//  TrackableScrollView
//
//  Created by DevChiwon on 4/29/25.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
