import Foundation
/**
 Makes network and mock calls.
 */
class NetworkService {
    private var generalConfiguration: NetworkConfiguration

    init(networkConfiguration: NetworkConfiguration) {
        self.generalConfiguration = networkConfiguration
    }
    /**
     Creates a task that retrieves the contents of the
    `URLRequest`, then calls a handler upon completion.
     - Parameters:
        - request: The `URLRequest` to be retrived.
        - completion: The completion handler to call
     when the request is complete.
     This completion handler takes the following parameters:
            - data: The data returned by the server,
     or nil if the request was failed.
            - response: An object represents a response
     to a request and provides response headers.
            - error: An error object that indicates why
     the request failed, or nil if the request was successful.
     - Returns: Instance of `URLSessionTask`.
     */
    private func networkRequest(request: URLRequest,
                                completion: @escaping CompletionHandler) -> URLSessionTask {
        let networkTask = URLSession.shared.dataTask(with: request) { (data, response, requestError) in
            if let requestError = requestError {
                completion(.failure(.error(statusCode: 400)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.error(statusCode: 505)))
                    return
            }
            if let data = data {
                completion(.success(data))
            }
        }
        networkTask.resume()
        
        return networkTask
    }
    
    private func mockRequest(request: URLRequest, completion: @escaping CompletionHandler) -> URLSessionTask {
        let mockTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if error != nil  {
                completion(.failure(.error(statusCode: 400)))
                return
            }
            if let data = data {
                completion(.success(data))
                return
            }
        }
        mockTask.resume()
        
        return mockTask
    }
}
