import Foundation
@testable import Sample

final class ServiceTwoStub: ServiceTwoProtocol {
    var response: Result<Void, Error> = .success(())
    
    func twoServiceCall(completion: (Result<Void, Error>) -> Void) {
        completion(response)
    }
}
