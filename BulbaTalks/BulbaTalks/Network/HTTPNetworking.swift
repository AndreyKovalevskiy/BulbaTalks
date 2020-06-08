import Foundation
/**
 Defines a method for interacting with a network using
 HTTP requests.
 */
protocol HTTPNetworking {
    /**
     Performs network request to receive data using the API.
     - Parameters:
        - apiEndpoint: API HTTP endpoint.
        - completion: The completion handler that accepts
        `Result` as a parameter, where the success case
        will store a received data and the failure case will be
        some `NetworkError`.
     - Returns: Instance of `URLSessionTask`.
     */
    func httpRequest(apiEndpoint: HTTPRequestable,
                     completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionTask?
}
