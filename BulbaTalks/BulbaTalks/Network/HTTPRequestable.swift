import Foundation

/**
 A type that contains properties to create a valid URLRequest,
 and can make a URLRequest using general configuration.
 */
protocol HTTPRequestable {
    var method: HTTPMethodType { get }
    var path: String { get }
    var headerParamaters: HTTPHeaderParameters { get }
    var queryParameters: HTTPQueryParameters { get }
    var bodyParamaters: HTTPBodyParameters { get }
    
    /**
     Returns the URLRequest, initialized with the general configuration
     and then configured with the current properties of the instance.
     
     - Parameter config: Basic configuration for request.
     - Returns: Valid URLRequest, or `nil` if URLRequest is not valid .
     */
    func urlRequest(using config: GeneralHTTPEndpointConfiguration) -> URLRequest?
}

extension HTTPRequestable {
    public func urlRequest(using config: GeneralHTTPEndpointConfiguration) -> URLRequest? {
        guard let url = url(using: config) else {
            return nil
        }

        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = method.rawValue

        var allHeaders: HTTPHeaders = config.commonHeaders
        headerParamaters.forEach { allHeaders.updateValue($1, forKey: $0) }
        urlRequest.allHTTPHeaderFields = allHeaders

        if !bodyParamaters.isEmpty {
            let bodyString = bodyParamaters
                                    .map { "\($0.key)=\($0.value)" }
                                    .joined(separator: "&")
                                    .addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""

            urlRequest.httpBody = bodyString.data(using: String.Encoding.ascii, allowLossyConversion: true)
        }

        return urlRequest
    }

    /**
     Returns the URL, based on general configuration and then configured
     with the current `path` of the instance
     
     - Parameter config: Basic configuration for URL.
     - Returns: Valid URL, or `nil` if URL is not valid.
     */
    private func url(using config: GeneralHTTPEndpointConfiguration) -> URL? {
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
