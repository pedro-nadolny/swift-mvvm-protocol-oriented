import Foundation
@testable import Sample

final class ServiceTwoDummy: ServiceTwoProtocol {
    func twoServiceCall(completion: (Result<Void, Error>) -> Void) {}
}
