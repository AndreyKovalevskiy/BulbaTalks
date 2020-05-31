import Foundation
/**
 Describes the foundation of data communication
 for the `NetworkServise` class.
 */
protocol HTTPNetworking {
    /**
     Provides a new name for an cosure which we can call in complition.
     */
    typealias CompletionHandler = (Result<Data, NetworkError>) -> Void
    /**
     Makes request based on the
     `HTTPRequestable` protocol, and calls a handler
     upon completion.
     - Parameters:
        - apiEndpoint: That enables the API to
        gain access to resources on a server.
        - completion: The `CompletionHandler`
        to call when the request is completed.
     - Returns: URLSessionTask.
     */
    func httpRequest(apiEndpoint: HTTPRequestable, completion: @escaping CompletionHandler) -> URLSessionTask?
}
