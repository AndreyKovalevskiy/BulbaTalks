@testable import BulbaTalks
import XCTest

/**
 Type conforming to the HTTPRequestable protocol for testing.
 */
struct HTTPRequestableStub: HTTPRequestable {
    var method: HTTPMethodType = .post
    var path: String = "validTestPath"
    var headerParameters: HTTPHeaderParameters = ["headerParameter": "headerValue"]
    var queryParameters: HTTPQueryParameters = ["queryKey": "queryValue"]
    var bodyParameters: HTTPBodyParameters = ["bodyKey": "bodyValue"]
}
