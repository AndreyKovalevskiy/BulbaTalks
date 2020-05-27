import Foundation

/**
 A type that describes the properties and methods for
 creating a valid `URLRequest`.
 */
protocol HTTPRequestable {
    var method: HTTPMethodType { get }
    var path: String { get }
    var headerParamaters: HTTPHeaderParameters { get }
    var queryParameters: HTTPQueryParameters { get }
    var bodyParamaters: HTTPBodyParameters { get }

    /**
     Returns the `URLRequest`, configured by the general
     configuration and current properties of the `HTTPRequestable` instance.
     
     - Parameter config: Basic configuration for request.
     - Returns: Valid `URLRequest`, or `nil` if `URLRequest` is not valid.
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
     Returns the `URL`, configured by the general configuration and
     current property `path` of the `HTTPRequestable` instance.
     
     - Parameter config: Basic configuration for `URL`.
     - Returns: Valid URL, or `nil` if `URL` is not valid.
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
