import UIKit

public struct GestureItem<Recognizer: UIGestureRecognizer> {
    public let recognizer: Recognizer
    public let gestureType: GestureType
}
