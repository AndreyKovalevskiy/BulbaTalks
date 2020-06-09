import Foundation
/**
 Provides interaction with the network.
 */
class NetworkService {
    /**
     The active network configuration.
     */
    private var activeNetworkConfiguration: NetworkConfiguration

    /**
     Creates a `NetworkService` object with the specified network configuration.
     */
    init(networkConfiguration: NetworkConfiguration) {
        self.activeNetworkConfiguration = networkConfiguration
    }

    /**
     Makes a network request and calls the handler after it completes.
     - Parameters:
       - request: The `URLRequest` that represents
       information about the request.
       - completion: The completion handler that accepts
       `Result` as a parameter, where the success case
       will get requested data and the failure case will get
       some `NetworkError`.
     */
    private func networkRequest(request: URLRequest,
                                completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let networkTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(.failure(.failedRequest))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                switch httpResponse.statusCode {
                case 400...499:
                    completion(.failure(.clientError))
                case 500...599:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.unexpectedStatusCode))
                }
                return
            }
            completion(.success(data!))
        }
        networkTask.resume()
    }

    /**
     Makes a mock request and calls the handler after it completes.
     - Parameters:
       - request: The `URLRequest` that represents
       information about the request.
       - completion: The completion handler that accepts
       `Result` as a parameter, where the success case
       will get requested data and the failure case will get
       some `NetworkError`.
     */
    private func mockRequest(request: URLRequest,
                             completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let mockedURL = request.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = Bundle.main.contentsOfFile(at: mockedURL) {
                completion(.success(data))
            } else {
                completion(.failure(.noData))
            }
        }
    }
}

extension NetworkService: HTTPNetworking {
    /**
     Performs network or mock requests depending
     on the active network configuration.
     - Parameters:
       - twitterAPIEndpoint: API endpoint for interacting with
       the Twitter API.
       - completion: The completion handler that accepts
       `Result` as a parameter, where the success case
       will get requested data and the failure case will get
       some `NetworkError`.
     */
    public func httpRequest(twitterAPIEndpoint: HTTPRequestable,
                            completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let urlRequest = twitterAPIEndpoint.urlRequest(using: activeNetworkConfiguration) else {
            completion(.failure(.invalidURLRequest))
            return
        }
        if activeNetworkConfiguration is RemoteNetworkConfiguration {
            return networkRequest(request: urlRequest, completion: completion)
        } else {
            return mockRequest(request: urlRequest, completion: completion)
        }
    }
}
