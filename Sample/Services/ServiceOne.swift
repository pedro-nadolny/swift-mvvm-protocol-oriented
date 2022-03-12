//
//  ServiceOne.swift
//  Sample
//
//  Created by Pedro Nadolny on 21/02/22.
//

import Foundation

protocol HasServiceOne {
    var serviceOne: ServiceOneProtocol { get }
}

protocol ServiceOneProtocol {
    func oneServiceCall(completion: (Result<Void, Error>) -> Void)
}

final class ServiceOne: ServiceOneProtocol {
    func oneServiceCall(completion: (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
}
