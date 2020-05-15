import Foundation

typealias HTTPHeaders = [String: String]
typealias HTTPQueryParameters = [String: String]
typealias HTTPHeaderParameters = [String: String]
typealias HTTPBodyParameters = [String: Any]

protocol HTTPRequestable {
    var method: HTTPMethodType { get }
    var path: String { get }
    var headerParamaters: HTTPHeaderParameters { get }
    var queryParameters: HTTPQueryParameters { get }
    var bodyParamaters: HTTPBodyParameters { get }

    func urlRequest(using networkConfig: GeneralDataSourceConfiguration) throws -> URLRequest
}

extension HTTPRequestable {
    public func urlRequest(using config: GeneralDataSourceConfiguration) throws -> URLRequest {
        guard let url = self.url(using: config) else {
            throw fatalError()
        }

        var urlRequest = URLRequest(url: url)

        var allHeaders: HTTPHeaders = config.commonHeaders
        headerParamaters.forEach { allHeaders.updateValue($1, forKey: $0) }

        if method == .post && !self.bodyParamaters.isEmpty {
            let fullQueryString = self.bodyParamaters
                                    .map { "\($0.key)=\($0.value)" }
                                    .joined(separator: "&")
                                    .addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""

            urlRequest.httpBody = fullQueryString.data(using: String.Encoding.ascii, allowLossyConversion: true)
        }

        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = allHeaders

        return urlRequest
    }

    private func url(using config: GeneralDataSourceConfiguration) -> URL? {
        let endpointURLString = config.baseURL.absoluteString.appending(path)

        guard var urlComponents = URLComponents(string: endpointURLString) else {
            return nil
        }

        var allURLQueryItems = [URLQueryItem]()
        config.commonQueryParameters.forEach {
            let queryItem = URLQueryItem(name: $0.key, value: $0.value)
            allURLQueryItems.append(queryItem)
        }
        self.queryParameters.forEach {
            let queryItem = URLQueryItem(name: $0.key, value: $0.value)
            allURLQueryItems.append(queryItem)
        }

        urlComponents.queryItems = !allURLQueryItems.isEmpty ? allURLQueryItems : nil
        return urlComponents.url
    }
}
