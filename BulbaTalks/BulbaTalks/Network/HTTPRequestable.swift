import Foundation

/**
 Describes the properties and methods for creating an HTTP endpoint
 that we can use when generating the HTTP request.
 */
protocol HTTPRequestable {
    /**
     HTTP method to indicate the desired action to be performed
     on the specified resource.
     */
    var method: HTTPMethodType { get }

    /**
     The path to the required information on the specified baseURL
     of the resource.
     */
    var path: String { get }

    /**
     HTTP headers that are used when creating the HTTP request.
     */
    var headerParameters: HTTPHeaderParameters { get }

    /**
     Parameters that are used in the URL to provide some
     additional information in the HTTP request.
     */
    var queryParameters: HTTPQueryParameters { get }

    /**
     Parameters that are used in the body of HTTP request to
     provide some additional information in the HTTP request.
     */
    var bodyParameters: HTTPBodyParameters { get }

    /**
     Creates the `URLRequest`, configured with the specific
     configuration and current instance protocol properties that
     conform to the `HTTPRequestable` protocol.

     - Parameter config: A network configuration to use to
     make the request.
     - Returns: A valid URLRequest, or `nil` if it's impossible
     to make a valid request.
     */
    func urlRequest(using config: NetworkConfiguration) -> URLRequest?
}

extension HTTPRequestable {
    public func urlRequest(using config: NetworkConfiguration) -> URLRequest? {
        guard let url = url(using: config) else {
            return nil
        }

        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = method.rawValue

        var allHeaders: HTTPHeaders = config.commonHeaders
        headerParameters.forEach { allHeaders.updateValue($1, forKey: $0) }
        urlRequest.allHTTPHeaderFields = allHeaders

        if !bodyParameters.isEmpty {
            let bodyString = bodyParameters
                .map { "\($0.key)=\($0.value)" }
                .joined(separator: "&")
                .addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""

            urlRequest.httpBody = bodyString.data(using: String.Encoding.ascii, allowLossyConversion: true)
        }

        return urlRequest
    }

    /**
     Creates the `URL`, configured with the specific configuration
     and current property `path` of the instance that conform to
     the `HTTPRequestable` protocol.

     - Parameter config: A network configuration to use to
     make the URL.
     - Returns: A valid URL, or `nil` if it's impossible to make
     a valid URL.
     */
    private func url(using config: NetworkConfiguration) -> URL? {
        let endpointURLString = config.baseURL.absoluteString.appending(path)

        guard var urlComponents = URLComponents(string: endpointURLString) else {
            return nil
        }

        var allURLQueryItems = [URLQueryItem]()
        queryParameters.forEach {
            let queryItem = URLQueryItem(name: $0.key, value: $0.value)
            allURLQueryItems.append(queryItem)
        }

        urlComponents.queryItems = !allURLQueryItems.isEmpty ? allURLQueryItems : nil
        return urlComponents.url
    }
}
