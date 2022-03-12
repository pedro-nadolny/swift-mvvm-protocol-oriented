//
//  ServiceOne.swift
//  Sample
//
//  Created by Pedro Nadolny on 21/02/22.
//

import Foundation

protocol HasServiceTwo {
    var serviceTwo: ServiceTwoProtocol { get }
}

protocol ServiceTwoProtocol {
    func twoServiceCall(completion: (Result<Void, Error>) -> Void)
}

final class ServiceTwo: ServiceTwoProtocol {
    func twoServiceCall(completion: (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
}
