import Foundation
/**
 Responsible for data communications and
 provides interaction with the network.
 */
protocol HTTPNetworking {
    /**
     Defines an alternative name for
     an existing closure type so as not to repeat the code.
     */
    typealias CompletionHandler = (Result<Data, NetworkError>) -> Void
    /**
     Makes async request to the given HTTP endpoint.
     - Parameters:
        - apiEndpoint: API HTTP endpoint.
        - completion: The `CompletionHandler`
        to call when the request is completed.
     - Returns: `URLSessionTask`.
     */
    func httpRequest(apiEndpoint: HTTPRequestable, completion: @escaping CompletionHandler) -> URLSessionTask?
}
