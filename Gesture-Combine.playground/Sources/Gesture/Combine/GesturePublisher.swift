import Combine
import UIKit

public struct GesturePublisher<Recognizer: UIGestureRecognizer>: Publisher {
    public typealias Output = GestureItem<Recognizer>
    public typealias Failure = Never

    public let item: GestureItem<Recognizer>

    public init(item: GestureItem<Recognizer>) {
        self.item = item
    }

    public func receive<S>(subscriber: S) where S: Subscriber,
                                         GesturePublisher.Failure == S.Failure, GesturePublisher.Output
    == S.Input {
        let subscription = GestureSubscription(
            subscriber: subscriber,
            item: item
        )
        subscriber.receive(subscription: subscription)
    }
}
