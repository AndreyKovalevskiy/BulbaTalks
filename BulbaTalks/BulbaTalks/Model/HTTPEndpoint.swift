/**
 Defines an HTTP Endpoint.

    Contains the properties and methods
    for the HTTP request.
 */
struct HTTPEndpoint { //: HTTPRequestable {
    var method: Int // HTTPMethodType
    var path: String
    var headerParamaters: HTTPHeaderParameters
    var queryParameters: HTTPQueryParameters
    var bodyParameters: HTTPBodyParameters
}
