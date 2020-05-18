/// The structure contains all the necessary properties for generating an HTTP request.
struct HTTPEndpoint: HTTPRequestable {
    var method: HTTPMethodType
    var path: String
    var headerParamaters: HTTPHeaderParameters
    var queryParameters: HTTPQueryParameters
    var bodyParamaters: HTTPBodyParameters
}
