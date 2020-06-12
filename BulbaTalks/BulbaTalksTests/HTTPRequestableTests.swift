@testable import BulbaTalks
import XCTest

class HTTPRequestableTests: XCTestCase {
    /**
     Type conforming to the HTTPRequestable protocol for testing.
     */
    struct TestableStruct: HTTPRequestable {
        var method: HTTPMethodType = .post
        var path: String = "validTestPath"
        var headerParameters: HTTPHeaderParameters = ["firstHeaderParameter": "firstTestValue",
                                                      "secondHeaderParameter": "secondTestValue"]
        var queryParameters: HTTPQueryParameters = ["queryKey": "queryValue"]
        var bodyParameters: HTTPBodyParameters = ["bodyKey": "bodyValue",
                                                  "anotherBodyKey": "anotherBodyValue"]
    }

    /**
     Relative paths used in tests to generate URLs.
     */
    private enum RelativePaths {
        /**
         Path used to verify the processing of invalid data.
         */
        static let invalidPath = "Invalid path with spaces"

        /**
         Path used to verify the processing of valid data.
         */
        static let validPath = "validTestPath?queryKey=queryValue"
    }

    /**
     The instance that we are testing.
     */
    var testableStruct: TestableStruct!

    /**
     Network cofiguration used in `urlRequest(using config:)`
     */
    var activeConfiguration: NetworkConfiguration!

    override func setUp() {
        super.setUp()
        testableStruct = TestableStruct()
        activeConfiguration = MockNetworkConfiguration()
    }

    func testURLRequestMethodReturnsNilWhenPropertyPathIsInvalidAndConfigurationIsMock() {
        // Given

        // When
        testableStruct.path = RelativePaths.invalidPath
        let urlRequest = testableStruct.urlRequest(using: activeConfiguration)

        // Then
        XCTAssertNil(urlRequest)
    }

    func testURLRequestMethodReturnsNilWhenPropertyPathIsInvalidAndConfigurationIsRemote() {
        // Given
        activeConfiguration = RemoteNetworkConfiguration()

        // When
        testableStruct.path = RelativePaths.invalidPath
        let urlRequest = testableStruct.urlRequest(using: activeConfiguration)

        // Then
        XCTAssertNil(urlRequest)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedURLForMockConfiguration() {
        // Given
        let expectedURL = activeConfiguration.baseURL.absoluteString.appending(RelativePaths.validPath)

        // When
        let requestURL = testableStruct.urlRequest(using: activeConfiguration)?.url?.absoluteString

        // Then
        XCTAssertEqual(requestURL, expectedURL)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedURLForRemoteConfiguration() {
        // Given
        activeConfiguration = RemoteNetworkConfiguration()
        let expectedURL = activeConfiguration.baseURL.absoluteString.appending(RelativePaths.validPath)

        // When
        let requestURL = testableStruct.urlRequest(using: activeConfiguration)?.url?.absoluteString

        // Then
        XCTAssertEqual(requestURL, expectedURL)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedHeaderParametersForMockConfiguration() {
        // Given
        let expectedHeaderParameters = testableStruct.headerParameters

        // When
        let requestHeaderParameters = testableStruct.urlRequest(using: activeConfiguration)?.allHTTPHeaderFields

        // Then
        XCTAssertEqual(requestHeaderParameters, expectedHeaderParameters)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedHeaderParametersForRemoteConfiguration() {
        // Given
        activeConfiguration = RemoteNetworkConfiguration()
        let expectedHeaderParameters = testableStruct.headerParameters

        // When
        let requestHeaderParameters = testableStruct.urlRequest(using: activeConfiguration)?.allHTTPHeaderFields

        // Then
        XCTAssertEqual(requestHeaderParameters, expectedHeaderParameters)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedHTTPMethod() {
        // Given
        let expectedHTTPMethod = testableStruct.method.rawValue

        // When
        let requestHTTPMethod = testableStruct.urlRequest(using: activeConfiguration)?.httpMethod

        // Then
        XCTAssertEqual(requestHTTPMethod, expectedHTTPMethod)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedBody() {
        // Given
        let expectedBody = "anotherBodyKey=anotherBodyValue&bodyKey=bodyValue"
            .data(using: .ascii, allowLossyConversion: true)

        // When
        let requestBody = testableStruct.urlRequest(using: activeConfiguration)?.httpBody

        // Then
        XCTAssertEqual(requestBody, expectedBody)
    }
}
