import Foundation
/**
 Provides interaction with the network.
 */
class NetworkService {
    /**
    The active network configuration.
    */
    private var activeNetworkConfiguration: NetworkConfiguration

    init(networkConfiguration: NetworkConfiguration) {
        self.activeNetworkConfiguration = networkConfiguration
    }
    /**
     Makes a network request and calls the handler after it finishes.
     - Parameters:
        - request: The `URLRequest` that provides the URL,
        request type, HTTP header fields, and so on.
        - completion: The completion handler that accepts
        `Result` as a parameter, where the success case
        will store a received data and the failure case will be
        some `NetworkError`.
     - Returns: Instance of `URLSessionTask`.
     */
    private func networkRequest(request: URLRequest,
                                completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionTask {
        let networkTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                completion(.failure(.badNetworkConection))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                switch httpResponse.statusCode {
                case 401 ... 500:
                    completion(.failure(.clientError))
                case 501 ... 599:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.failedRequest))
                }
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }
        networkTask.resume()
        
        return networkTask
    }
    /**
    Makes a mock request and calls the handler after it finishes.
    - Parameters:
       - request: The `URLRequest` that provides the URL,
       request type, HTTP header fields, and so on.
       - completion: The completion handler that accepts
       `Result` as a parameter, where the success case
       will store a received data and the failure case will be
       some `NetworkError`.
    - Returns: `nil`. This means that a new session data
    task is not being created.
    */
    private func mockRequest(request: URLRequest,
                             completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionTask? {
        guard let urlMock = request.url else {
            completion(.failure(.invalidURL))
            return nil
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = Bundle.main.contentsOfFile(at: urlMock) {
                completion(.success(data))
            } else {
                completion(.failure(.noData))
            }
        }
       
        return nil
    }
}

extension NetworkService: HTTPNetworking {
    /**
    Performs network or mock requests depending
    on the active network configuration.
    - Parameters:
       - apiEndpoint: API endpoint for interacting with
       the Twitter API.
       - completion: The completion handler that accepts
       `Result` as a parameter, where the success case
       will store a received data and the failure case will be
       some `NetworkError`.
    - Returns: Instance of `URLSessionTask`.
    */
    public func httpRequest(apiEndpoint:HTTPRequestable,
                            completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionTask? {
        guard let urlRequest = apiEndpoint.urlRequest(using: activeNetworkConfiguration) else {
            completion(.failure(.invalidURLRequest))
            return nil
        }
        if activeNetworkConfiguration is RemoteNetworkConfiguration {
            return networkRequest(request: urlRequest, completion: completion)
        } else {
            return mockRequest(request: urlRequest, completion: completion)
        }
    }
}
