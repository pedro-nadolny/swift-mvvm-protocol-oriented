import XCTest
@testable import Sample

final class FeatureOneTestCase: XCTestCase {
    struct Sut: FeatureOne {
        let serviceOne: ServiceOneProtocol
    }

    private let serviceOneStub = ServiceOneStub()
    private lazy var sut = Sut(serviceOne: serviceOneStub)

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
}
