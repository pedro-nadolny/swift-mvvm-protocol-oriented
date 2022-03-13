import Foundation

typealias ViewModelFeatures = FeatureOne &
                              FeatureTwo

struct ViewModel: ViewModelFeatures {
    let serviceOne: ServiceOneProtocol
    let serviceTwo: ServiceTwoProtocol
}
