import Foundation
/**
 Defines methods and properties for interacting with a network
 using HTTP requests.
 */
protocol HTTPNetworking {
    /**
     Performs network request to receive data using the API.
     - Parameters:
        - apiEndpoint: API HTTP endpoint.
        - completion: The completion handler where the success
     case will get some data returned by the server and
     the failure case will get some `NetworkError`.
     - Returns: Instance of `URLSessionTask`.
     */
    func httpRequest(apiEndpoint: HTTPRequestable,
                     completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionTask?
}
