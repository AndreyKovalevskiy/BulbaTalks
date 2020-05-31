import Foundation
/**
 Responsible for data communications and
 provides interaction with the server.
 */
protocol HTTPNetworking {
    /**
     Provides a new name for the enum Result type.
     */
    typealias CompletionHandler = (Result<Data, NetworkError>) -> Void
    /**
     Makes request based on the
     `HTTPRequestable` protocol and calls a handler
     upon completion.
     - Parameters:
        - apiEndpoint: Point through which we
        interact with the server.
        - completion: The `CompletionHandler`
        to call when the request is completed.
     - Returns: URLSessionTask.
     */
    func httpRequest(apiEndpoint: HTTPRequestable, completion: @escaping CompletionHandler) -> URLSessionTask?
}
