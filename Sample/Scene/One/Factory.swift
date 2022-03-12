import UIKit

enum Factory {
    static func make() -> UIViewController {
        return ViewController()
    }
}
