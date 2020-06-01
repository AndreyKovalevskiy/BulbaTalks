/**
 Defines the API Endpoints.
 Contains methods for getting information from Twitter API.
 */
struct APIEndpoints {
    /**
     Constructs the HTTP endpoint to get a collection
     a timeline of tweets.
     - Parameters:
        - headerParameters: Parameters that form
        headers in the HTTP request.
        - queryParameters: Parameters that form
        a query string in the URL.
        - bodyParameters: Parameters included in
        the body in the HTTP request.
     - Returns: The object describing API HTTP
     Endpoint to get timeline of tweets.
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
     Constructs the HTTP endpoint to get user
     authentication information.
     - Parameters:
        - headerParameters: Parameters that form
        headers in the HTTP request.
        - queryParameters: Parameters that form
        a query string in the URL.
        - bodyParameters: Parameters included in
        the body in the HTTP request.
     - Returns: The object describing API HTTP
     Endpoint to get user authentication information.
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
