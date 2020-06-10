/**
 Describes network error.
 */
enum NetworkError: Error {
    /**
     Error caused by the client.
     */
    case clientError
    /**
     Network request failure.
     */
    case failedRequest
    /**
     Invalid response received.
     */
    case invalidResponse
    /**
     Error caused by an invalid URL.
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
     Error caused by the server.
     */
    case serverError
    /**
     The server returned an unexpected status code.
     */
    case unexpectedStatusCode

    /**
     A more detailed description of the network error.
     */
    var description: String {
        switch self {
        case .clientError:
            return "Error caused by the client."
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
        case .serverError:
            return "Error caused by the server."
        case .unexpectedStatusCode:
            return "The server returned an unexpected status code."
        }
    }
}
