import Combine
import UIKit

final class GestureSubscription<S: Subscriber, Recognizer: UIGestureRecognizer>: Subscription where S.Input == GestureItem<Recognizer>, S.Failure == Never {
    private var subscriber: S?
    private let item: GestureItem<Recognizer>

    init(subscriber: S, item: GestureItem<Recognizer>) {
        self.subscriber = subscriber
        self.item = item
        configureGesture()
    }

    private func configureGesture() {
        let recognizer = item.recognizer
        recognizer.addTarget(self, action: #selector(handler))
    }

    func request(_ demand: Subscribers.Demand) {}

    func cancel() {
        subscriber = nil
    }

    @objc
    private func handler() {
        _ = subscriber?.receive(item)
    }
}


