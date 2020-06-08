import Foundation
/**
 Describes a method for performing HTTP request.
 */
protocol HTTPNetworking {
    /**
     Performs network request to receive data using the API.
     - Parameters:
        - apiEndpoint: API HTTP endpoint.
        - completion: A completion handler (with a `Result`
        enumeration as a parameter) used in network requests.
        In case of success, the received data will be stored.
        In case of failure, there will be a certain `NetworkError`.
     - Returns: Instance of `URLSessionTask`.
     */
    func httpRequest(apiEndpoint: HTTPRequestable,
                     completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionTask?
}
