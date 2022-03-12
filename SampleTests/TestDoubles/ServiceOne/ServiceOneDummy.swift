import Foundation
@testable import Sample

final class ServiceOneDummy: ServiceOneProtocol {
    func oneServiceCall(completion: (Result<Void, Error>) -> Void) {}
}
