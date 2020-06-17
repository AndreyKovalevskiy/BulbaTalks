@testable import BulbaTalks
import XCTest

class HTTPEndpointTests: XCTestCase {
    func testPublicPropertiesContainExpectedValuesWhenEndpointIsInitializedWithGivenParameters() {
        // Given
        let expectedMethod = HTTPMethodType.get
        let expectedPath = "1.1/statuses/home_timeline.json"
        let expectedHeaderParameters = [String: String]()
        let expectedQueryParameters = [String: String]()
        let initialBodyParameters = ["body": "Body"]
        let expectedBodyParameters = initialBodyParameters
        let expectedParameterValue = expectedBodyParameters["body"]

        // When
        let timelineEndpoint = HTTPEndpoint(method: expectedMethod,
                                            path: expectedPath,
                                            headerParameters: expectedHeaderParameters,
                                            queryParameters: expectedQueryParameters,
                                            bodyParameters: initialBodyParameters)

        // Then
        let timelineEnpointBodyParameters = timelineEndpoint.bodyParameters
        let value = timelineEnpointBodyParameters["body"] as? String

        XCTAssertEqual(timelineEndpoint.method, expectedMethod)
        XCTAssertEqual(timelineEndpoint.path, expectedPath)
        XCTAssertEqual(timelineEndpoint.headerParameters, expectedHeaderParameters)
        XCTAssertEqual(timelineEndpoint.queryParameters, expectedQueryParameters)
        XCTAssertNotNil(value)
        XCTAssertEqual(value, expectedParameterValue)
    }
}
