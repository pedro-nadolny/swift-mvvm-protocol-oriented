import UIKit

protocol FactoryProtocol {
    func make() -> UIViewController
}

final class Factory: FactoryProtocol {
    func make() -> UIViewController {
        let serviceOne = ServiceOne()
        let serviceTwo = ServiceTwo()
        let viewModel = ViewModel(serviceOne: serviceOne,
                                  serviceTwo: serviceTwo)
        return ViewController(viewModel: viewModel)
    }
}
