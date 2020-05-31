import Foundation
/**
 Describes the foundation of data communication
 for the `NetworkServise` class.
 */
protocol HTTPNetworking {
    /**
     Provides a new name for an existing data type.
     */
    typealias CompletionHandler = (Result<Data, NetworkError>) -> Void
    /**
     Makes request based on the specified  `URLRequest`
     object, and calls a handler upon completion.
     - Parameters:
        - apiEndpoint: A URL that enables the API to
        gain access to resources on a server.
        - completion: The `CompletionHandler`
        to call when the load request is completed.
     - Returns: URLSessionTask.
     */
    func httpRequest(apiEndpoint: HTTPRequestable, completion: @escaping CompletionHandler) -> URLSessionTask
}
