@testable import BulbaTalks
import XCTest

class HTTPRequestableTests: XCTestCase {
    /**
     Base URL of the absolute resource URL. Contains base URL
     used in tests to initialize network configurations.
     */
    private enum BaseURL {
        /// Base URL used to initialize mock network configuration.
        static let mock = URL(string: "file:///Some/base/URL/to/mock/data/")!

        /// Base URL used to initialize remote network configuration.
        static let remote = URL(string: "https://api.twitter.com/")!
    }

    /**
     Relative paths of an absolute resource URL. Used in tests to
     generate different variants of an absolute resource URL.
     */
    private enum URLPath {
        /// Relative path of the URL used to form URL with spaces.
        static let containingSpaces = "TestPathWithSpaces?queryKey=queryValue "
    }

    /// Mock network cofiguration used in `urlRequest(:)`
    private var mockNetworkConfiguration: MockNetworkConfiguration!

    /// Remote network cofiguration used in `urlRequest(:)`
    private var remoteNetworkConfiguration: RemoteNetworkConfiguration!

    override func setUp() {
        super.setUp()
        mockNetworkConfiguration = MockNetworkConfiguration(baseURL: BaseURL.mock,
                                                            commonHeaders: [:])
        remoteNetworkConfiguration = RemoteNetworkConfiguration(baseURL: BaseURL.remote,
                                                                commonHeaders: [:])
    }

    func testURLRequestMethodReturnsNilWhenPropertyPathContainsSpacesAndNetworkConfigurationIsMock() {
        // Given
        let invalidHTTPRequestable = HTTPRequestableStub(path: URLPath.containingSpaces)

        // When
        let urlRequest = invalidHTTPRequestable.urlRequest(using: mockNetworkConfiguration)

        // Then
        XCTAssertNil(urlRequest)
    }

    func testURLRequestMethodReturnsNilWhenPropertyPathContainsSpacesAndNetworkConfigurationIsRemote() {
        // Given
        let invalidHTTPRequestable = HTTPRequestableStub(path: URLPath.containingSpaces)

        // When
        let urlRequest = invalidHTTPRequestable.urlRequest(using: remoteNetworkConfiguration)

        // Then
        XCTAssertNil(urlRequest)
    }

    func testURLRequestMethodReturnsURLRequestWithExpectedURLWhenGivenMockConfiguration() {
        // Given
        let validHTTPRequestable = HTTPRequestableStub()
        let expectedURL = URL(string: "file:///Some/base/URL/to/mock/data/validTestPath?queryKey=queryValue")

        // When
        let resultURL = validHTTPRequestable.urlRequest(using: mockNetworkConfiguration)?.url

        // Then
        XCTAssertNotNil(resultURL)
        XCTAssertEqual(resultURL, expectedURL)
    }

    func testURLRequestMethodReturnsURLRequestWithExpectedURLWhenGivenRemoteConfiguration() {
        // Given
        let validHTTPRequestable = HTTPRequestableStub()
        let expectedURL = URL(string: "https://api.twitter.com/validTestPath?queryKey=queryValue")

        // When
        let resultURL = validHTTPRequestable.urlRequest(using: remoteNetworkConfiguration)?.url

        // Then
        XCTAssertNotNil(resultURL)
        XCTAssertEqual(resultURL, expectedURL)
    }

    func testURLRequestMethodReturnsRequestThatContainsExpectedProperties() {
        // Given
        let validHTTPRequestable = HTTPRequestableStub()
        let expectedHTTPMethod = validHTTPRequestable.method.rawValue
        let expectedHeaderParameters = ["headerParameter": "headerValue"]
        let expectedBody = "bodyKey=bodyValue"
            .data(using: .ascii, allowLossyConversion: true)

        // When
        let urlRequest = validHTTPRequestable.urlRequest(using: mockNetworkConfiguration)

        // Then
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.httpMethod, expectedHTTPMethod)
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields, expectedHeaderParameters)
        XCTAssertEqual(urlRequest?.httpBody, expectedBody)
    }
}
