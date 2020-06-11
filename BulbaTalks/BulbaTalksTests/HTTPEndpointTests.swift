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

    func testPropertyMethodReturnsGetMethodTypeWhenIsInitializedWithGetMethod() {
        // Given
        let initializedMethod = HTTPMethodType.get

        // When
        let timelineEnpointMethod = timelineEndpoint.method

        // Then
        XCTAssertEqual(timelineEnpointMethod, initializedMethod)
    }

    func testPropertyMethodDoesNotReturnPostMethodTypeWhenIsInitializedWithGetMethod() {
        // Given
        let initializedMethod = HTTPMethodType.post

        // When
        let timelineEnpointMethod = timelineEndpoint.method

        // Then
        XCTAssertNotEqual(timelineEnpointMethod, initializedMethod)
    }

    func testPropertyPathReturnsPathAsStringWhenIsInitializedWithStringPath() {
        // Given
        let initializedPath = "1.1/statuses/home_timeline.json"

        // When
        let timelineEnpointPath = timelineEndpoint.path

        // Then
        XCTAssertEqual(timelineEnpointPath, initializedPath)
    }

    func testPropertyHeaderParametersReturnsEmptyDictionaryWhenIsInitializedWithEmptyDictionary() {
        // Given
        let initializedHeaderParameters = [String: String]()

        // When
        let timelineEnpointHeaderParameters = timelineEndpoint.headerParameters

        // Then
        XCTAssertEqual(timelineEnpointHeaderParameters, initializedHeaderParameters)
    }

    func testPropertyQueryParametersReturnsEmptyDictionaryWhenIsInitializedWithEmptyDictionary() {
        // Given
        let initializedQueryParameters = [String: String]()

        // When
        let timelineEnpointQueryParameters = timelineEndpoint.queryParameters

        // Then
        XCTAssertEqual(timelineEnpointQueryParameters, initializedQueryParameters)
    }

    func testPropertyBodyParametersReturnsValueAsStringFromDictionaryWhenIsInitializedWithValueAsString() {
        // Given
        let initializedBodyParameters = ["body": "Body"]
        let initializedValue = initializedBodyParameters["body"]

        // When
        let timelineEnpointBodyParameters = timelineEndpoint.bodyParameters
        let value = timelineEnpointBodyParameters["body"] as? String

        // Then
        XCTAssertEqual(value, initializedValue)
    }

    override func tearDown() {
        timelineEndpoint = nil
        super.tearDown()
    }
}
