import Foundation

protocol FeatureOne: HasServiceOne & HasServiceTwo {}

extension FeatureOne {
    func featureOne(completion: @escaping (Result<Void, Error>) -> Void) {
        serviceOne.oneServiceCall { result in
            guard case .success = result else {
                completion(result)
                return
            }
            
            serviceTwo.twoServiceCall(completion: completion)
        }
    }
}
