struct APIEndpoints {
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
