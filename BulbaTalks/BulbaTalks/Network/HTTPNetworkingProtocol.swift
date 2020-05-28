import Foundation
/**
 Describes an actual implomentation of those requirements
 for `NetworkServise` class.
 */
protocol HTTPNetworking {
    /**
     Provides a new name for an existing data type which
     describes value that represents either a ` success`
     or a `failure`:
     - `Success` with the value of the result.
     - `Failure` with the type that implements
     Error protocol.
     */
    typealias CompletionHandler = (Result<Data, Error>) -> Void
    /**
     Makes request based on the specified  `URLRequest`
     object, and calls a handler upon completion.
     - Parameters:
        - apiEndpoint: A valid `URLRequest`.
        - completion: The ` CompletionHandler`
     to call when the load request is complete.
     */
    func httpRequest(apiEndpoint: HTTPRequestable, completion: @escaping CompletionHandler)
}
