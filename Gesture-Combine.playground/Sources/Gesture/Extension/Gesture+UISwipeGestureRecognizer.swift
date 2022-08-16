import UIKit

public extension Gesture where Recognizer: UISwipeGestureRecognizer {
    @discardableResult
    func direction(_ value: UISwipeGestureRecognizer.Direction) -> Self {
        item.recognizer.direction = value
        return self
    }
}
