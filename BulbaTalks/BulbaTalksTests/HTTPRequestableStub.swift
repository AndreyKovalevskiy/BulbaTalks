@testable import BulbaTalks
import XCTest

/// Type conforming to the HTTPRequestable protocol for testing.
struct HTTPRequestableStub: HTTPRequestable {
    let method: HTTPMethodType
    let path: String
    let headerParameters: HTTPHeaderParameters
    let queryParameters: HTTPQueryParameters
    let bodyParameters: HTTPBodyParameters

    init(method: HTTPMethodType = .post,
         path: String = "validTestPath",
         headerParameters: HTTPHeaderParameters = ["headerParameter": "headerValue"],
         queryParameters: HTTPQueryParameters = ["queryKey": "queryValue"],
         bodyParameters: HTTPBodyParameters = ["bodyKey": "bodyValue"]) {
        self.method = method
        self.path = path
        self.headerParameters = headerParameters
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters

    }
}
