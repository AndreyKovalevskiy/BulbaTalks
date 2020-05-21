/// The object that contains methods to make requests.
struct APIEndpoints {
    /**
     Returns the object contains properties to make
     an HTTP request to get home_timeline.
     - Parameters:
        - headersParameters: These parameters will be included in
        the request header.
        - queryParameters: These parameters will be included in
        the query string.
        - bodyParameters: These parameters will be included in
        the request body.
     - Returns: The object contains properties to make
     an HTTP request to get home_timeline.
     */
    static func getHomeTimeline(with headersParameters: HTTPHeaderParameters,
                                queryParameters: HTTPQueryParameters,
                                bodyParameters: HTTPBodyParameters) -> HTTPRequestable {
        return HTTPEndpoint(method: .get,
                            path: "1.1/statuses/home_timeline.json",
                            headerParamaters: headersParameters,
                            queryParameters: queryParameters,
                            bodyParamaters: bodyParameters)
    }
}
