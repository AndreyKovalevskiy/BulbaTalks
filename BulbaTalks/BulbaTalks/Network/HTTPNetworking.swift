import Foundation
/**
 Performs HTTP request and
 provides interaction with the network.
 */
protocol HTTPNetworking {
    /**
     Introduce this in order not to repeat our code
     and to make the code more clean and readable.
     */
    typealias CompletionHandler = (Result<Data, NetworkError>) -> Void
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
    func httpRequest(apiEndpoint: HTTPRequestable, completion: @escaping CompletionHandler) -> URLSessionTask?
}
