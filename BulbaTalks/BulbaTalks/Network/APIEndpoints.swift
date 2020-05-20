/// The object that contains methods for generating requests.
struct APIEndpoints {
    /**
     Returns the object contains all the necessary properties
     for generating an HTTP request to get home_timeline.
     - Parameters:
        - headersParameters: These parameters will be included in the request header.
        - queryParameters: These parameters will be included in the query string.
        - bodyParameters: These parameters will be included in the request body.
     - Returns: The object contains all the necessary properties
     for generating an HTTP request to get home_timeline.
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
