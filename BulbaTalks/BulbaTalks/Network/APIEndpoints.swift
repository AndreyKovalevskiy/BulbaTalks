/**
 Defines the API Endpoints.
 Contains methods for the HTTP request.
 */
struct APIEndpoints {
    /**
     Returns the `HTTPEndpoint` object
     for the HTTP request to get a collection
     of the most recent tweets.

     - Parameters:
        - headerParameters: These parameters will be
        included in the HTTP request header.
        - queryParameters: These parameters will be
        included in the end of the URL.
        - bodyParameters: These parameters will be
        included in the HTTP request body.
     - Returns: The `HTTPEndpoint` object.
     */
    static func getHomeTimeline(with headerParameters: HTTPHeaderParameters,
                                queryParameters: HTTPQueryParameters,
                                bodyParameters: HTTPBodyParameters) -> HTTPRequestable {
        return HTTPEndpoint(method: .get,
                            path: "1.1/statuses/home_timeline.json",
                            headerParameters: headerParameters,
                            queryParameters: queryParameters,
                            bodyParameters: bodyParameters)
    }

    /**
     Returns the `HTTPEndpoint` object
     for the HTTP request to get a representation
     of the requesting user.

     - Parameters:
        - headerParameters: These parameters will be
        included in the HTTP request header.
        - queryParameters: These parameters will be
        included in the end of the URL.
        - bodyParameters: These parameters will be
        included in the HTTP request body.
     - Returns: The `HTTPEndpoint` object.
     */
    static func getAuthenticatedUser(with headerParameters: HTTPHeaderParameters,
                                     queryParameters: HTTPQueryParameters,
                                     bodyParameters: HTTPBodyParameters) -> HTTPRequestable {
        return HTTPEndpoint(method: .get,
                            path: "1.1/account/verify_credentials.json",
                            headerParameters: headerParameters,
                            queryParameters: queryParameters,
                            bodyParameters: bodyParameters)
    }
}
