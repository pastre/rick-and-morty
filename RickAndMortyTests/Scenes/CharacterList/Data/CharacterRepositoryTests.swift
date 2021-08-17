import XCTest // Quick | Nible | OHHTTPSStubs

@testable import RickAndMorty

final class CharacterRepositoryTest: XCTestCase {
    
    // Testing doubles
    private let serviceStub = CharacterServiceStub()
    
    // System under test
    private lazy var sut = CharacterRepository(service: serviceStub)
    
    // MARK: - Unit tests
    

    
    func test_fetchCharacters_whenUMACONDICAO_thenOESPERADO() {
        
        // Given
        let expectation = XCTestExpectation()
        
        // When
        sut.fetchCharacters { _ in
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
}

final class CharacterServiceStub: CharacterServiceProtocol {
    
    var dataToUse: Data = .init()
    
    func fetchCharacters(completion: @escaping (Data) -> Void) {
        completion(dataToUse)
    }
}



// Testing doubles
// Dummy, Spy, Stub, Fake, Mock
