import UIKit

public enum GestureType {
    case tap(UITapGestureRecognizer = UITapGestureRecognizer())
    case swipe(UISwipeGestureRecognizer = UISwipeGestureRecognizer())
    case longPress(UILongPressGestureRecognizer = UILongPressGestureRecognizer())
    case pan(UIPanGestureRecognizer = UIPanGestureRecognizer())
    case pinch(UIPinchGestureRecognizer = UIPinchGestureRecognizer())
    case edge(UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer())

    public var gesture: UIGestureRecognizer {
        switch self {
        case let .tap(tapGesture):
            return tapGesture
        case let .swipe(swipeGesture):
            return swipeGesture
        case let .longPress(longPressGesture):
            return longPressGesture
        case let .pan(panGesture):
            return panGesture
        case let .pinch(pinchGesture):
            return pinchGesture
        case let .edge(edgePanGesture):
            return edgePanGesture
        }
    }

    public var state: UIGestureRecognizer.State {
        gesture.state
    }
}


