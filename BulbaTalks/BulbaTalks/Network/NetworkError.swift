/**
 Describes network error.
 */
enum NetworkError: Error {
    /**
     Error with a specific HTTP status code.
     */
    case badResponse(statusCode: Int)
    /**
     Network request failure.
     */
    case failedRequest
    /**
     Invalid response received.
     */
    case invalidResponse
    /**
     Invalid URL.
     */
    case invalidURL
    /**
     Error caused by an invalid `URLRequest`.
     */
    case invalidURLRequest
    /**
     The response returned with no data.
     */
    case noData

    /**
     A more detailed description of the network error.
     */
    var description: String {
        switch self {
        case let .badResponse(statusCode):
            return "The call failed with HTTP code \(statusCode)."
        case .failedRequest:
            return "Network request failed."
        case .invalidResponse:
            return "Invalid response received."
        case .invalidURL:
            return "The request failed due to an invalid URL."
        case .invalidURLRequest:
            return "The request failed due to an invalid URLRequest."
        case .noData:
            return "Response returned with no data."
        }
    }
}
