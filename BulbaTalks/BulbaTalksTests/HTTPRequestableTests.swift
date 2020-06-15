@testable import BulbaTalks
import XCTest

class HTTPRequestableTests: XCTestCase {
    /**
     Type conforming to the HTTPRequestable protocol for testing.
     */
    private struct HTTPRequestableStub: HTTPRequestable {
        var method: HTTPMethodType = .post
        var path: String = "validTestPath"
        var headerParameters: HTTPHeaderParameters = ["headerParameter": "headerValue"]
        var queryParameters: HTTPQueryParameters = ["queryKey": "queryValue"]
        var bodyParameters: HTTPBodyParameters = ["bodyKey": "bodyValue"]
    }

    /**
     Base URL of the absolute resource URL. Used in tests to
     initialize network configurations.
     */
    private enum BasePartsOfTheFullURL {
        /**
         Base URL used to initialize mock network configuration.
         */
        static let mockBaseURL = URL(string: "file:///Some/base/URL/to/mock/data/")!

        /**
         Base URL used to initialize remote network configuration.
         */
        static let remoteBaseURL = URL(string: "https://api.twitter.com/")!
    }

    /**
     Relative paths of an absolute resource URL. Used in tests to
     generate different variants of an absolute resource URL.
     */
    private enum RelativePathsOfTheFullURL {
        /**
         Relative path of the URL used to form an invalid URL.
         */
        static let invalidPathContainingSpaces = "invalidTestPath With Spaces?queryKey=queryValue"

        /**
         Relative path of the URL used to form a valid URL.
         */
        static let validPath = "validTestPath?queryKey=queryValue"
    }

    /**
     The instance of the type conforming to the HTTPRequestable
     protocol.
     */
    private var testableStruct: HTTPRequestableStub!

    /**
     Mock network cofiguration used in `urlRequest(:)`
     */
    private var mockNetworkConfiguration: MockNetworkConfiguration!

    /**
     Remote network cofiguration used in `urlRequest(:)`
     */
    private var remoteNetworkConfiguration: RemoteNetworkConfiguration!

    override func setUp() {
        super.setUp()
        testableStruct = HTTPRequestableStub()
        mockNetworkConfiguration = MockNetworkConfiguration(baseURL: BasePartsOfTheFullURL.mockBaseURL,
                                                            commonHeaders: [:])
        remoteNetworkConfiguration = RemoteNetworkConfiguration(baseURL: BasePartsOfTheFullURL.remoteBaseURL,
                                                                commonHeaders: [:])
    }

    func testURLRequestMethodReturnsNilWhenPropertyPathContainsSpacesAndNetworkConfigurationIsMock() {
        // Given
        testableStruct.path = RelativePathsOfTheFullURL.invalidPathContainingSpaces

        // When
        let urlRequest = testableStruct.urlRequest(using: mockNetworkConfiguration)

        // Then
        XCTAssertNil(urlRequest)
    }

    func testURLRequestMethodReturnsNilWhenPropertyPathContainsSpacesAndNetworkConfigurationIsRemote() {
        // Given
        testableStruct.path = RelativePathsOfTheFullURL.invalidPathContainingSpaces

        // When
        let urlRequest = testableStruct.urlRequest(using: remoteNetworkConfiguration)

        // Then
        XCTAssertNil(urlRequest)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedURLForMockConfiguration() {
        // Given
        let expectedURL = URL(string: "file:///Some/base/URL/to/mock/data/validTestPath?queryKey=queryValue")

        // When
        let requestURL = testableStruct.urlRequest(using: mockNetworkConfiguration)?.url

        // Then
        XCTAssertNotNil(expectedURL)
        XCTAssertNotNil(requestURL)
        XCTAssertEqual(requestURL, expectedURL)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedURLForRemoteConfiguration() {
        // Given
        let expectedURL = URL(string: "https://api.twitter.com/validTestPath?queryKey=queryValue")

        // When
        let requestURL = testableStruct.urlRequest(using: remoteNetworkConfiguration)?.url

        // Then
        XCTAssertNotNil(expectedURL)
        XCTAssertNotNil(requestURL)
        XCTAssertEqual(requestURL, expectedURL)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedProperties() {
        // Given
        let expectedHTTPMethod = testableStruct.method.rawValue
        let expectedHeaderParameters = ["headerParameter": "headerValue"]
        let expectedBody = "bodyKey=bodyValue"
            .data(using: .ascii, allowLossyConversion: true)

        // When
        let urlRequest = testableStruct.urlRequest(using: mockNetworkConfiguration)

        // Then
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.httpMethod, expectedHTTPMethod)
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields, expectedHeaderParameters)
        XCTAssertEqual(urlRequest?.httpBody, expectedBody)
    }
}
