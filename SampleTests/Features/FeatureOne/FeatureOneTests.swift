import XCTest
@testable import Sample

final class Sut: FeatureOne {
    let serviceOne: ServiceOneProtocol
    let serviceTwo: ServiceTwoProtocol
    
    typealias Dependencies = HasServiceOne & HasServiceTwo
    
    init(dependencies: Dependencies) {
        self.serviceOne = dependencies.serviceOne
        self.serviceTwo = dependencies.serviceTwo
    }
}

final class FeatureOneTestCase: XCTestCase {
    
    private let serviceOneStub = ServiceOneStub()
    private let serviceTwoStub = ServiceTwoStub()
    
    private lazy var sut = Sut(
        dependencies: DependencyContainer.fixture(
            serviceOne: serviceOneStub,
            serviceTwo: serviceTwoStub
        )
    )

    func testFeatureOne_whenCalledAndBothServicesReturnSuccess_shouldReturnSuccess() throws {
        //Given
        let expectation = expectation(description: "completion is called")
        var result: Result<Void, Error>?
        
        //When
        sut.featureOne { returnedResult in
            expectation.fulfill()
            result = returnedResult
        }
        
        //Then
        waitForExpectations(timeout: 0.1)
        guard case .success = result else {
            XCTFail("success not returned")
            return
        }
    }
    
    func testFeatureOne_whenServiceOneReturnError_shouldReturnError() throws {
        //Given
        let expectation = expectation(description: "completion is called")
        var result: Result<Void, Error>?
        serviceOneStub.response = .failure(NSError())
        
        //When
        sut.featureOne { returnedResult in
            expectation.fulfill()
            result = returnedResult
        }
        
        //Then
        waitForExpectations(timeout: 0.1)
        guard case .failure = result else {
            XCTFail("failure not returned")
            return
        }
    }
    
    func testFeatureOne_whenServiceTwoReturnError_shouldReturnError() throws {
        //Given
        let expectation = expectation(description: "completion is called")
        var result: Result<Void, Error>?
        serviceTwoStub.response = .failure(NSError())
        
        //When
        sut.featureOne { returnedResult in
            expectation.fulfill()
            result = returnedResult
        }
        
        //Then
        waitForExpectations(timeout: 0.1)
        guard case .failure = result else {
            XCTFail("failure not returned")
            return
        }
    }
    
    func testFeatureOne_whenServiceOneAndServiceTwoReturnError_shouldReturnError() throws {
        //Given
        let expectation = expectation(description: "completion is called")
        var result: Result<Void, Error>?
        serviceOneStub.response = .failure(NSError())
        serviceTwoStub.response = .failure(NSError())
        
        //When
        sut.featureOne { returnedResult in
            expectation.fulfill()
            result = returnedResult
        }
        
        //Then
        waitForExpectations(timeout: 0.1)
        guard case .failure = result else {
            XCTFail("failure not returned")
            return
        }
    }
}

