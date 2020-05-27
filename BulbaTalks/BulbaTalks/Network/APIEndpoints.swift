/// The API Endpoints.
struct APIEndpoints {
    /**
     Returns the object contains parameters to construct
     `HTTPEndpoint` to get `home_timeline`.

     - Parameters:
        - headerParameters: These parameters will be included in
        the request header.
        - queryParameters: These parameters will be included in
        the query string.
        - bodyParameters: These parameters will be included in
        the request body.
     - Returns: The `HTTPEndpoint` object.
     */
    static func getHomeTimeline(with headerParameters: HTTPHeaderParameters,
                                queryParameters: HTTPQueryParameters,
                                bodyParameters: HTTPBodyParameters) -> HTTPRequestable {
        return HTTPEndpoint(method: .get,
                            path: "1.1/statuses/home_timeline.json",
                            headerParamaters: headerParameters,
                            queryParameters: queryParameters,
                            bodyParamaters: bodyParameters)
    }

    /**
     Returns the object contains parameters to construct
     `HTTPEndpoint` to get `verify_credentials`.

     - Parameters:
        - headerParameters: These parameters will be included in
        the request header.
        - queryParameters: These parameters will be included in
        the query string.
        - bodyParameters: These parameters will be included in
        the request body.
     - Returns: The `HTTPEndpoint` object.
     */
    static func getAuthenticatedUser(with headerParameters: HTTPHeaderParameters,
                                     queryParameters: HTTPQueryParameters,
                                     bodyParameters: HTTPBodyParameters) -> HTTPRequestable {
        return HTTPEndpoint(method: .get,
                            path: "1.1/account/verify_credentials.json",
                            headerParamaters: headerParameters,
                            queryParameters: queryParameters,
                            bodyParamaters: bodyParameters)
    }
}
