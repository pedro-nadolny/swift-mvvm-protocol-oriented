import Foundation
@testable import Sample

final class ServiceOneStub: ServiceOneProtocol {
    var response: Result<Void, Error> = .success(())
    
    func oneServiceCall(completion: (Result<Void, Error>) -> Void) {
        completion(response)
    }
}
