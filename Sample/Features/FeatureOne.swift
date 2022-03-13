import Foundation

protocol FeatureOne: HasServiceOne {}

extension FeatureOne {
    func featureOne(completion: @escaping (Result<Void, Error>) -> Void) {
        serviceOne.oneServiceCall(completion: completion)
    }
}
