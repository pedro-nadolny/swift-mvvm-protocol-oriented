import UIKit

final class ViewController: UIViewController {
    
    private let viewModel: ViewModelProtocol
    
    init(viewModel: ViewModelProtocol = ViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        viewModel.featureOne { _ in }
    }
}
