@testable import BulbaTalks
import XCTest

class HTTPEndpointTests: XCTestCase {
    let endpoint = HTTPEndpoint(method: .get,
                                path: "1.1/statuses/home_timeline.json",
                                headerParameters: [:],
                                queryParameters: [:],
                                bodyParameters: [:])

    func testPropertyMethodWhenIsGet() {
        // Given
        let expectedMethod = HTTPMethodType.get

        // When
        let method = endpoint.method

        // Then
        XCTAssertEqual(method, expectedMethod)
    }

    func testMethodPropertyWhenIsNotGet() {
        // Given
        let expectedMethod = HTTPMethodType.post

        // When
        let method = endpoint.method

        // Then
        XCTAssertNotEqual(method, expectedMethod)
    }

    func testPropertyPathWhenIsValidString() {
        // Given
        let expectedPath = "1.1/statuses/home_timeline.json"

        // When
        let path = endpoint.path

        // Then
        XCTAssertEqual(path, expectedPath)
    }

    func testPropertyPathWhenIsInvalidString() {
        // Given
        let expectedPath = "1.1/statuses/home_timeline.jso"

        // When
        let path = endpoint.path

        // Then
        XCTAssertNotEqual(path, expectedPath)
    }

    func testPropertyHeaderParametersWhenIsValidDictionary() {
        // Given
        let expectedHeaderParameters = [String: String]()

        // When
        let headerParameters = endpoint.headerParameters

        // Then
        XCTAssertEqual(headerParameters, expectedHeaderParameters)
    }

    func testPropertyHeaderParametersWhenIsInvalidDictionary() {
        // Given
        let expectedHeaderParameters = ["header": "Header"]

        // When
        let headerParameters = endpoint.headerParameters

        // Then
        XCTAssertNotEqual(headerParameters, expectedHeaderParameters)
    }

    func testPropertyQueryParametersWhenIsValidDictionary() {
        // Given
        let expectedQueryParameters = [String: String]()

        // When
        let queryParameters = endpoint.queryParameters

        // Then
        XCTAssertEqual(queryParameters, expectedQueryParameters)
    }

    func testPropertyQueryParametersWhenIsInvalidDictionary() {
        // Given
        let expectedQueryParameters = ["query": "Query"]

        // When
        let queryParameters = endpoint.queryParameters

        // Then
        XCTAssertNotEqual(queryParameters, expectedQueryParameters)
    }

    func testPropertyBodyParametersWhenIsValidValue() {
        // Given
        var expectedBodyParameters = [String: Any]()
        expectedBodyParameters = ["body": "Body"]
        let expectedValue = expectedBodyParameters["body"] as? String

        // When
        var bodyParameters = endpoint.bodyParameters
        bodyParameters = ["body": "Body"]
        let value = bodyParameters["body"] as? String

        // Then
        XCTAssertEqual(value, expectedValue)
    }

    func testPropertyBodyParametersWhenIsInvalidValue() {
        // Given
        var expectedBodyParameters = [String: Any]()
        expectedBodyParameters = ["body": "Bodies"]
        let expectedValue = expectedBodyParameters["body"] as? String

        // When
        var bodyParameters = endpoint.bodyParameters
        bodyParameters = ["body": "Body"]
        let value = bodyParameters["body"] as? String

        // Then
        XCTAssertNotEqual(value, expectedValue)
    }
}
