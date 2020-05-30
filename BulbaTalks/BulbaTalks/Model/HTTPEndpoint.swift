/**
 Defines an HTTP Endpoint.
 Contains the properties and methods
 for the HTTP request.
 */
struct HTTPEndpoint: HTTPRequestable {
    var method: HTTPMethodType
    var path: String
    var headerParameters: HTTPHeaderParameters
    var queryParameters: HTTPQueryParameters
    var bodyParameters: HTTPBodyParameters
}
