/**
 Describes network error.
 */
enum NetworkError: Error {
    /**
     The error related to bad network connection.
     */
    case badNetworkConection
    /**
     A client-side error while executing the request.
     */
    case clientError
    /**
     Network request failure.
     */
    case failedRequest
    /**
     The error related to the invalid response received.
     */
    case invalidResponse
    /**
     The error related to a malformed URL.
     */
    case invalidURL
    /**
     The error related to a malformed URLRequest.
     */
    case invalidURLRequest
    /**
     The error related to the response returned with no data.
     */
    case noData
    /**
     The server failed to fulfill a request.
     */
    case serverError

    /**
     A more detailed description of the network error.
     */
    var description: String {
        switch self {
        case .badNetworkConection:
            return "Bad network conection."
        case .clientError:
            return "A client-side error occurred while executing the request."
        case .failedRequest:
            return "Network request failed."
        case .invalidResponse:
            return "Invalid response received."
        case .invalidURL:
            return "The connection failed due to a malformed URL."
        case .invalidURLRequest:
            return "The connection failed due to a malformed URLRequest."
        case .noData:
            return "Response returned with no data."
        case .serverError:
            return "The server failed to fulfill a request."
        }
    }
}
