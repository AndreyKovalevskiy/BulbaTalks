import Foundation

extension NetworkService: HTTPNetworking {
    public func httpRequest(apiEndpoint:HTTPRequestable, completion: @escaping CompletionHandler) -> URLSessionTask? {
        guard let urlRequest = try? apiEndpoint.urlRequest(using: generalConfiguration) else {
            completion(.failure(.error(statusCode: 502)))
            return nil
        }
        if generalConfiguration is RemoteNetworkConfiguration {
            generalConfiguration = MockNetworkConfiguration()
            return mockRequest(request: URLRequest, completion: @escaping CompletionHandler)
        } else {
            generalConfiguration = RemoteNetworkConfiguration()
            return networkRequest(request: URLRequest, completion: @escaping CompletionHandler)
        }
    }
}
