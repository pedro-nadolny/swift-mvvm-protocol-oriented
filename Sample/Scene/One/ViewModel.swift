import Foundation

typealias ViewModelProtocol = FeatureOne & FeatureTwo

final class ViewModel: ViewModelProtocol {
    typealias Dependencies = HasServiceOne &
                             HasServiceTwo
    
    let serviceOne: ServiceOneProtocol
    let serviceTwo: ServiceTwoProtocol
        
    init(dependencies: Dependencies = DependencyContainer.main) {
        self.serviceOne = dependencies.serviceOne
        self.serviceTwo = dependencies.serviceTwo
    }
}
