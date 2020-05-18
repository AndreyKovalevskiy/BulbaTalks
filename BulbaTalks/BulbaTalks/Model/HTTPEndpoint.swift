/// The structure contains all the necessary properties for generating an HTTP request.
struct HTTPEndpoint: HTTPRequestable {
    /// Enum of request methods such as `GET` and `POST`.
    var method: HTTPMethodType
    /// The path used to create the URL resource.
    var path: String
    /// These parameters will be included in the request header. Typealias [String: String].
    var headerParamaters: HTTPHeaderParameters
    /// These parameters will be included in the query string. Typealias [String: String].
    var queryParameters: HTTPQueryParameters
    /// These parameters will be included in the request body. Typealias [String: Any].
    var bodyParamaters: HTTPBodyParameters
}
