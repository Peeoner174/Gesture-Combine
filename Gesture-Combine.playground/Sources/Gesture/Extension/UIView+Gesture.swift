import UIKit

public extension UIView {
    func tap(
        _ recognizer: UITapGestureRecognizer = UITapGestureRecognizer()
    ) -> Gesture<UITapGestureRecognizer> {
        gesture(.init(recognizer: recognizer, gestureType: .tap(recognizer)))
    }

    func swipe(
        _ recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    ) -> Gesture<UISwipeGestureRecognizer> {
        gesture(.init(recognizer: recognizer, gestureType: .swipe(recognizer)))
    }

    func longPress(
        _ recognizer: UILongPressGestureRecognizer = UILongPressGestureRecognizer()
    ) -> Gesture<UILongPressGestureRecognizer> {
        gesture(.init(recognizer: recognizer, gestureType: .longPress(recognizer)))
    }

    func pan(
        _ recognizer: UIPanGestureRecognizer = UIPanGestureRecognizer()
    ) -> Gesture<UIPanGestureRecognizer> {
        gesture(.init(recognizer: recognizer, gestureType: .pan(recognizer)))
    }

    func pinch(
        _ recognizer: UIPinchGestureRecognizer = UIPinchGestureRecognizer()
    ) -> Gesture<UIPinchGestureRecognizer> {
        gesture(.init(recognizer: recognizer, gestureType: .pinch(recognizer)))
    }

    func edge(
        _ recognizer: UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer()
    ) -> Gesture<UIScreenEdgePanGestureRecognizer> {
        gesture(.init(recognizer: recognizer, gestureType: .edge(recognizer)))
    }

    private func gesture<Recognizer: UIGestureRecognizer>(_ item: GestureItem<Recognizer>) -> Gesture<Recognizer> {
        addGestureRecognizer(item.recognizer)
        return .init(item: item)
    }
}
