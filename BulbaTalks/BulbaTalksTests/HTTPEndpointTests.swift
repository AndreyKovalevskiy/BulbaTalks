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
                                        bodyParameters: ["body": "Body"])
    }

    override func tearDown() {
        timelineEndpoint = nil
        super.tearDown()
    }

    func testParameterMethodReturnsGetMethodTypeWhenIsInitializedWithGetMethod() {
        // Given
        let expectedMethod = HTTPMethodType.get

        // When
        let timelineEnpointMethod = timelineEndpoint.method

        // Then
        XCTAssertEqual(timelineEnpointMethod, expectedMethod)
    }

    func testParameterPathReturnsPathAsSpecificStringWhenIsInitializedWithString() {
        // Given
        let expectedPath = "1.1/statuses/home_timeline.json"

        // When
        let timelineEnpointPath = timelineEndpoint.path

        // Then
        XCTAssertEqual(timelineEnpointPath, expectedPath)
    }

    func testParameterHeaderParametersReturnsEmptyDictionaryWhenIsInitializedWithEmptyDictionary() {
        // Given
        let expectedHeaderParameters = [String: String]()

        // When
        let timelineEnpointHeaderParameters = timelineEndpoint.headerParameters

        // Then
        XCTAssertEqual(timelineEnpointHeaderParameters, expectedHeaderParameters)
    }

    func testParameterQueryParametersReturnsEmptyDictionaryWhenIsInitializedWithEmptyDictionary() {
        // Given
        let expectedQueryParameters = [String: String]()

        // When
        let timelineEnpointQueryParameters = timelineEndpoint.queryParameters

        // Then
        XCTAssertEqual(timelineEnpointQueryParameters, expectedQueryParameters)
    }

    func testParameterBodyParametersReturnsExpectedStringValueByKeyWhenIsInitializedWithValueAsString() {
        // Given
        let expectedBodyParameters = ["body": "Body"]
        let expectedValue = expectedBodyParameters["body"]

        // When
        let timelineEnpointBodyParameters = timelineEndpoint.bodyParameters
        let value = timelineEnpointBodyParameters["body"] as? String

        // Then
        XCTAssertEqual(value, expectedValue)
    }
}
