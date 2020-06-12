@testable import BulbaTalks
import XCTest

class HTTPEndpointTests: XCTestCase {
    var timelineEndpoint: HTTPEndpoint!

    override func setUp() {
        super.setUp()
        timelineEndpoint = HTTPEndpoint(method: .get,
                                        path: "1.1/statuses/home_timeline.json",
                                        headerParameters: [:],
                                        queryParameters: [:],
                                        bodyParameters: [:])
    }

    override func tearDown() {
        timelineEndpoint = nil
        super.tearDown()
    }

    func testMethodPropertyReturnsGetMethodTypeWhenIsInitializedWithGetMethod() {
        // Given // When
        let expectedMethod = HTTPMethodType.get

        // Then
        let timelineEnpointMethod = timelineEndpoint.method
        XCTAssertEqual(timelineEnpointMethod, expectedMethod)
    }

    func testPathPropertyReturnsPathAsSpecificStringWhenIsInitializedWithString() {
        // Given // When
        let expectedPath = "1.1/statuses/home_timeline.json"

        // Then
        let timelineEnpointPath = timelineEndpoint.path
        XCTAssertEqual(timelineEnpointPath, expectedPath)
    }

    func testHeaderParametersPropertyReturnsEmptyDictionaryWhenIsInitializedWithEmptyDictionary() {
        // Given // When
        let expectedHeaderParameters = [String: String]()

        // Then
        let timelineEnpointHeaderParameters = timelineEndpoint.headerParameters
        XCTAssertEqual(timelineEnpointHeaderParameters, expectedHeaderParameters)
    }

    func testQueryParametersPropertyReturnsEmptyDictionaryWhenIsInitializedWithEmptyDictionary() {
        // Given // When
        let expectedQueryParameters = [String: String]()

        // Then
        let timelineEnpointQueryParameters = timelineEndpoint.queryParameters
        XCTAssertEqual(timelineEnpointQueryParameters, expectedQueryParameters)
    }

    func testBodyParametersPropertyContaintsExpectedParameterWhenIsInitializedWithGivenParameter() {
        // Given
        let initialBodyParameters = ["body": "Body"]
        let expectedBodyParameters = initialBodyParameters
        let expectedParameterValue = expectedBodyParameters["body"]

        // When // setUp
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
