@testable import BulbaTalks
import XCTest

class HTTPEndpointTests: XCTestCase {
    func testMethodPathHeaderParametersQueryParametersPropertiesContainExpectedParametersWhenAreInitializedWithGivenParameters() {
        // Given
        let expectedMethod = HTTPMethodType.get
        let expectedPath = "1.1/statuses/home_timeline.json"
        let expectedHeaderParameters = [String: String]()
        let expectedQueryParameters = [String: String]()

        // When
        let timelineEndpoint = HTTPEndpoint(method: .get,
                                            path: "1.1/statuses/home_timeline.json",
                                            headerParameters: [:],
                                            queryParameters: [:],
                                            bodyParameters: [:])

        // Then
        let timelineEnpointMethod = timelineEndpoint.method
        let timelineEnpointPath = timelineEndpoint.path
        let timelineEnpointHeaderParameters = timelineEndpoint.headerParameters
        let timelineEnpointQueryParameters = timelineEndpoint.queryParameters

        XCTAssertEqual(timelineEnpointMethod, expectedMethod)
        XCTAssertEqual(timelineEnpointPath, expectedPath)
        XCTAssertEqual(timelineEnpointHeaderParameters, expectedHeaderParameters)
        XCTAssertEqual(timelineEnpointQueryParameters, expectedQueryParameters)
    }

    func testBodyParametersPropertyContainsExpectedParameterWhenIsInitializedWithGivenParameter() {
        // Given
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
        let timelineEnpointBodyParameters = timelineEndpoint.bodyParameters
        let value = timelineEnpointBodyParameters["body"] as? String

        XCTAssertNotNil(value)
        XCTAssertEqual(value, expectedParameterValue)
    }
}
