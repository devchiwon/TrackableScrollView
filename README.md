# TrackableScrollView

A lightweight SwiftUI component to track scroll position and trigger events when reaching the bottom.  
Perfect for infinite scroll, pagination, or scroll analytics.

스크롤 위치를 추적하고 하단 도달 시 이벤트를 트리거하는 가벼운 SwiftUI 컴포넌트입니다.  
무한 스크롤, 페이지네이션, 스크롤 분석에 완벽한 솔루션입니다.

![Swift](https://img.shields.io/badge/swift-5.7-orange.svg)
![SPM](https://img.shields.io/badge/SPM-compatible-green.svg)
![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)

---

## ✨ Features / 주요 기능

- Observe current scroll offset in real-time
- Detect when user scrolls to bottom
- Lightweight and easy to integrate
- Fully written in SwiftUI (iOS 13+)

- 실시간 스크롤 오프셋 관찰
- 사용자가 하단에 도달했을 때 감지
- 가볍고 쉬운 통합
- SwiftUI로 완전히 작성됨 (iOS 13+)

---

## 📦 Installation / 설치 방법

### Swift Package Manager (SPM)

```swift
dependencies: [
    .package(url: "https://github.com/devchiwon/TrackableScrollView.git", from: "1.0.2")
]
```

### Via Xcode / Xcode를 통한 설치:

You can add this package directly through Xcode's package manager:
Xcode의 패키지 매니저를 통해 직접 추가할 수 있습니다:

    1. Go to File → Add Packages...
       File → Add Packages... 메뉴로 이동
    2. Enter the URL / URL 입력: https://github.com/devchiwon/TrackableScrollView.git
    3. Choose the version and click Add Package
       버전을 선택하고 Add Package 클릭

---

## 🚀 Usage / 사용 방법

```swift
import TrackableScrollView

struct ContentView: View {
    @State private var offset: CGFloat = 0
    @State private var reachedBottom = false

    var body: some View {
        TrackableScrollView(
            axis: .vertical,
            showsIndicators: true,
            bottomThreshold: 200, // Trigger when 200 points from bottom / 하단에서 200포인트 남았을 때 트리거
            onScroll: { offset = $0 },
            onReachBottom: { reachedBottom = true }
        ) {
            VStack(spacing: 20) {
                ForEach(0..<100) { i in
                    Text("Row \(i)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}
```

---

## 📐 Parameters / 매개변수

The TrackableScrollView component accepts several parameters to customize its behavior:
TrackableScrollView 컴포넌트는 동작을 커스터마이즈하기 위한 여러 매개변수를 제공합니다:

| Parameter        | Type                | Description (EN/KR)                        |
|-----------------|---------------------|-------------------------------------------|
| `axis`          | `Axis.Set`         | Scroll direction (`.vertical` / `.horizontal`)<br>스크롤 방향 (`.vertical` / `.horizontal`) |
| `onScroll`      | `(CGFloat) -> Void`| Called with current scroll offset<br>현재 스크롤 오프셋과 함께 호출됨 |
| `onReachBottom` | `() -> Void`       | Called when reaching bottom threshold<br>하단 임계값에 도달했을 때 호출됨 |
| `bottomThreshold`| `CGFloat`         | Distance from bottom to trigger callback (default: 100pt)<br>하단 이벤트 트리거 거리 (기본값: 100pt) |
| `showsIndicators`| `Bool`            | Show/hide scroll indicators (default: true)<br>스크롤 인디케이터 표시 여부 (기본값: true) |

---

## 📄 License / 라이선스

This project is licensed under the MIT License.
See LICENSE for more information.

이 프로젝트는 MIT 라이선스를 따릅니다.
자세한 내용은 LICENSE 파일을 참조하세요.

---

## 🙌 Contributing / 기여하기

Contributions, issues and feature requests are welcome!
Feel free to open a pull request or submit an issue.

기여, 이슈 및 기능 요청을 환영합니다!
언제든지 풀 리퀘스트를 열거나 이슈를 제출해주세요.

---

🔗 Author / 작성자

DevChiwon
