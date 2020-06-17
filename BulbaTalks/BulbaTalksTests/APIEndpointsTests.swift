@testable import BulbaTalks
import XCTest

class APIEndpointsTests: XCTestCase {
    func testGetHomeTimelineMethodReturnsExpectedHTTPEndpoint() {
        // Given
        let expectedHeaderParameters = ["firstHeaderKey": "firstHeaderValue",
                                        "secondHeaderKey": "secondHeaderValue"]
        let expectedQueryParameters = ["firstQueryKey": "firstQueryValue",
                                       "secondQueryKey": "secondQueryValue"]

        // When
        let endpoint = APIEndpoints.getHomeTimeline(with: expectedHeaderParameters,
                                                    queryParameters: expectedQueryParameters)

        // Then
        XCTAssertEqual(endpoint.method, HTTPMethodType.get)
        XCTAssertEqual(endpoint.path, "1.1/statuses/home_timeline.json")
        XCTAssertEqual(endpoint.headerParameters, expectedHeaderParameters)
        XCTAssertEqual(endpoint.queryParameters, expectedQueryParameters)
        XCTAssert(endpoint.bodyParameters.isEmpty)
    }

    func testGetAuthenticatedUserMethodReturnsExpectedHTTPEndpoint() {
        // Given
        let expectedHeaderParameters = ["firstHeaderKey": "firstHeaderValue",
                                        "secondHeaderKey": "secondHeaderValue"]

        // When
        let endpoint = APIEndpoints.getAuthenticatedUser(with: expectedHeaderParameters)

        // Then
        XCTAssertEqual(endpoint.method, HTTPMethodType.get)
        XCTAssertEqual(endpoint.path, "1.1/account/verify_credentials.json")
        XCTAssertEqual(endpoint.headerParameters, expectedHeaderParameters)
        XCTAssert(endpoint.queryParameters.isEmpty)
        XCTAssert(endpoint.bodyParameters.isEmpty)
    }
}
