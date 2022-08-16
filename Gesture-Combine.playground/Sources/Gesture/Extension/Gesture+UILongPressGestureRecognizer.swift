import UIKit

public extension Gesture where Recognizer: UILongPressGestureRecognizer {
    @discardableResult
    func minimumPressDuration(_ value: TimeInterval) -> Self {
        item.recognizer.minimumPressDuration = value
        return self
    }
}
