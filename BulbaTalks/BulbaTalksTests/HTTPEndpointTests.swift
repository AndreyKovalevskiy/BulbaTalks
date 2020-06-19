@testable import BulbaTalks
import XCTest

class HTTPEndpointTests: XCTestCase {
    func testPublicPropertiesContainExpectedValuesWhenEndpointIsInitializedWithGivenParameters() {
        // Given
        let expectedMethod = HTTPMethodType.get
        let expectedPath = "1.1/statuses/home_timeline.json"
        let expectedHeaderParameters = [String: String]()
        let expectedQueryParameters = [String: String]()
        let expectedBodyParameters = ["bodyParameterName": "bodyParameterValue"]
        let expectedParameterValue = expectedBodyParameters["bodyParameterName"]

        // When
        let timelineEndpoint = HTTPEndpoint(method: expectedMethod,
                                            path: expectedPath,
                                            headerParameters: expectedHeaderParameters,
                                            queryParameters: expectedQueryParameters,
                                            bodyParameters: expectedBodyParameters)

        // Then
        XCTAssertEqual(timelineEndpoint.method, expectedMethod)
        XCTAssertEqual(timelineEndpoint.path, expectedPath)
        XCTAssertEqual(timelineEndpoint.headerParameters, expectedHeaderParameters)
        XCTAssertEqual(timelineEndpoint.queryParameters, expectedQueryParameters)
        let bodyParameterValue = timelineEndpoint.bodyParameters["bodyParameterName"] as? String
        XCTAssertNotNil(bodyParameterValue)
        XCTAssertEqual(bodyParameterValue, expectedParameterValue)
    }
}
