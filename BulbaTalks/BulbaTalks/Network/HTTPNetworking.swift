import Foundation
/**
 Describes additional functionality for
 the `NetworkServise` class.
 */
protocol HTTPNetworking {
    /**
     Provides a new name for an existing data type which
     describes value that represents either a `success`
     or a `failure`:
     - `Success` with the value of the result.
     - `Failure` with the type that implements
     `NetworlError`.
     */
    typealias CompletionHandler = (Result<Data, NetworkError>) -> Void
    /**
     Makes request based on the specified  `URLRequest`
     object, and calls a handler upon completion.
     - Parameters:
        - apiEndpoint: A valid `URLRequest`.
        - completion: The `CompletionHandler` to call when the load request is completed.
     - Returns: URLSessionTask.
     */
    func httpRequest(apiEndpoint: HTTPRequestable, completion: @escaping CompletionHandler) -> URLSessionTask
}
