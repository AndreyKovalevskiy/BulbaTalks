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
        let timelineEndpoint = HTTPEndpoint(method: .get,
                                            path: "1.1/statuses/home_timeline.json",
                                            headerParameters: [:],
                                            queryParameters: [:],
                                            bodyParameters: initialBodyParameters)

        // Then
        let timelineEnpointMethod = timelineEndpoint.method
        let timelineEnpointPath = timelineEndpoint.path
        let timelineEnpointHeaderParameters = timelineEndpoint.headerParameters
        let timelineEnpointQueryParameters = timelineEndpoint.queryParameters
        let timelineEnpointBodyParameters = timelineEndpoint.bodyParameters
        let value = timelineEnpointBodyParameters["body"] as? String

        XCTAssertEqual(timelineEnpointMethod, expectedMethod)
        XCTAssertEqual(timelineEnpointPath, expectedPath)
        XCTAssertEqual(timelineEnpointHeaderParameters, expectedHeaderParameters)
        XCTAssertEqual(timelineEnpointQueryParameters, expectedQueryParameters)
        XCTAssertNotNil(value)
        XCTAssertEqual(value, expectedParameterValue)
    }
}
