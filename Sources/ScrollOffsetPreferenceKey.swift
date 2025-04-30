//
//  ScrollOffsetPreferenceKey.swift
//  TrackableScrollView
//
//  Created by DevChiwon on 4/29/25.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat

    static var defaultValue: Value = 0

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}
