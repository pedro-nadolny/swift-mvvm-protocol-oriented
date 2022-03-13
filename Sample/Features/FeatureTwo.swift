import Foundation

protocol FeatureTwo: HasServiceOne &
                     HasServiceTwo {}

extension FeatureTwo {
    func featureTwo(completion: @escaping (Result<Void, Error>) -> Void) {
        serviceOne.oneServiceCall(completion: completion)
        serviceTwo.twoServiceCall(completion: completion)
    }
}
