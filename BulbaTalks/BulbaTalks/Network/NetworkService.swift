import Foundation
/**
 Performs network and mock requests and
 provides interaction with the network
 */
class NetworkService {
    
    private var generalConfiguration: NetworkConfiguration

    init(networkConfiguration: NetworkConfiguration) {
        self.generalConfiguration = networkConfiguration
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
                                completion: @escaping CompletionHandler) -> URLSessionTask {
        let networkTask = URLSession.shared.dataTask(with: request) { (data, response, requestError) in
            
            if requestError != nil {
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
     Makes mock request and then calls a handler upon
     completion.
     */
    private func mockRequest(request: URLRequest,
                             completion: @escaping CompletionHandler) -> URLSessionTask {
        let mockTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if error != nil {
                completion(.failure(.error(statusCode: 400)))
                return
            }
            guard let data = data else {
                completion(.failure(.error(statusCode: 500)))
                return
            }
            completion(.success(data))
        }
        mockTask.resume()
        
        return mockTask
    }
}

extension NetworkService: HTTPNetworking {
    public func httpRequest(apiEndpoint:HTTPRequestable, completion: @escaping CompletionHandler) -> URLSessionTask? {
        guard let urlRequest = apiEndpoint.urlRequest(using: generalConfiguration) else {
            completion(.failure(.error(statusCode: 500)))
            return nil
        }
        if generalConfiguration is RemoteNetworkConfiguration {
            return networkRequest(request: urlRequest,
                               completion: completion)
        } else {
            return mockRequest(request: urlRequest,
                                  completion: completion)
        }
    }
}
