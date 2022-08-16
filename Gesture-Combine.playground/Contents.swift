//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Combine

final class MyViewController: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        let view = UIView()
        self.view = view
    }
    
    // Adding gestures examples
    private func addGestures() {
        let doubleTap = view.tap()
            .numberOfTapsRequired(2)
            .addHandler { [weak self] gestureItem in
                print("Double tap event")
            }
            .store(in: &cancellables)
        
        view.tap()
            .numberOfTapsRequired(1)
            .require(toFail: doubleTap)
            .addHandler { [weak self] gestureItem in
                print("Single tap event")
            }
            .store(in: &cancellables)
        
        let longPress = view.longPress()
            .minimumPressDuration(0.2)
            .addHandler { [weak self] gestureItem in
                print("Long press event")
            }
            .store(in: &cancellables)

        view.swipe()
            .direction(.left)
            .require(toFail: longPress)
            .addRecognizerHandler { [weak self] swipeGestureRecognizer in
                 print("Swipe left event")
            }
            .store(in: &cancellables)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
