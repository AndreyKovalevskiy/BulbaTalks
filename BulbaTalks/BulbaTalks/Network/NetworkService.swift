import Foundation
/**
 Performs network and mock requests and
 provides interaction with the network
 */
class NetworkService {
    private var activeNetworkConfiguration: NetworkConfiguration

    init(networkConfiguration: NetworkConfiguration) {
        self.activeNetworkConfiguration = networkConfiguration
    }
    /**
     Makes network request and then calls a handler upon
     completion.
     - Parameters:
        - request: The `URLRequest` to be retrived.
        - completion: The completion handler to call
     when the request is complete.
     This completion handler takes the following parameters:
            - data: The data returned by the server,
     or `nil` if the request was failed.
            - response: An object represents a response
     to a request and provides response headers.
            - error: An error object that indicates why
     the request failed, or `nil` if the request was successful.
     - Returns: Instance of `URLSessionTask`.
     */
    private func networkRequest(request: URLRequest,
                                completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionTask {
        let networkTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                completion(.failure(.error(statusCode: 400)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.error(statusCode: 500)))
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.error(statusCode: httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.error(statusCode: 500)))
                return
            }
            completion(.success(data))
        }
        networkTask.resume()
        
        return networkTask
    }
    /**
     Makes mock request.
     */
    private func mockRequest(request: URLRequest,
                             completion: (Result<Data, NetworkError>) -> Void) -> URLSessionTask? {
        guard let urlMock = request.url else {
            completion(.failure())
            return nil
            
        }
        if let data = Bundle.main.contentsOfFile(at: urlMock) {
            completion(.success(data))
        }
        return nil
    }
}

extension NetworkService: HTTPNetworking {
    public func httpRequest(apiEndpoint:HTTPRequestable, completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionTask? {
        guard let urlRequest = apiEndpoint.urlRequest(using: activeNetworkConfiguration) else {
            completion(.failure(.error(statusCode: 500)))
            return nil
        }
        if activeNetworkConfiguration is RemoteNetworkConfiguration {
            return networkRequest(request: urlRequest,
                                  completion: completion)
        } else {
            return mockRequest(request: urlRequest,
                                  completion: completion)
        }
    }
}
