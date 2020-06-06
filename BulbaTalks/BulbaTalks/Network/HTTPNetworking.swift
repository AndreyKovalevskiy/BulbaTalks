import Foundation
/**
 Performs HTTP request and
 provides interaction with the network.
 */
protocol HTTPNetworking {
    /**
     Makes asynchronous request
     to the given HTTP endpoint and
     returns the new session task.
     - Parameters:
        - apiEndpoint: API HTTP endpoint.
        - completion: The `CompletionHandler`
        to call when the request is completed.
     - Returns: `URLSessionTask`.
     */
    func httpRequest(apiEndpoint: HTTPRequestable,
                     completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionTask?
}
