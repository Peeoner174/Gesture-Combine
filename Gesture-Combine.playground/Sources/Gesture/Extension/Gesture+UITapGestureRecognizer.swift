import UIKit

public extension Gesture where Recognizer: UITapGestureRecognizer {
    @discardableResult
    func numberOfTapsRequired(_ value: Int) -> Self {
        item.recognizer.numberOfTapsRequired = value
        return self
    }
}
