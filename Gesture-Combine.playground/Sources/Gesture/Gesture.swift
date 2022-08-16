import Combine
import UIKit

public final class Gesture<Recognizer: UIGestureRecognizer> {
    public let item: GestureItem<Recognizer>
    public let publisher: GesturePublisher<Recognizer>

    private var cancellables = Set<AnyCancellable>()

    public init(item: GestureItem<Recognizer>) {
        self.item = item
        self.publisher = .init(item: item)
    }

    @discardableResult
    public func store(in set: inout Set<AnyCancellable>) -> Self {
        set.formUnion(cancellables)
        return self
    }

    @discardableResult
    public func addHandler(
        filter: @escaping (GestureItem<Recognizer>) -> Bool = { _ in true },
        handler: @escaping (GestureItem<Recognizer>) -> Void
    ) -> Self {
        publisher.share().filter(filter).sink(receiveValue: handler).store(in: &cancellables)
        return self
    }

    @discardableResult
    public func addRecognizerHandler(
        filter: @escaping (Recognizer) -> Bool = { _ in true },
        handler: @escaping (Recognizer) -> Void
    ) -> Self {
        self.addHandler(filter: { filter($0.recognizer) }, handler: { handler($0.recognizer) })
    }

    @discardableResult
    public func require<OtherRecognizer: UIGestureRecognizer>(
        toFail otherGesture: Gesture<OtherRecognizer>
    ) -> Self {
        item.recognizer.require(toFail: otherGesture.item.recognizer)
        return self
    }
}


