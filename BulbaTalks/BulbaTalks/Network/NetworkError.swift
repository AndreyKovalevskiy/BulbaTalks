/**
 Describes network error.
 */
enum NetworkError: Error {
    /**
     Bad response with a specific HTTP status code.
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
     Invalid `URLRequest`.
     */
    case invalidURLRequest
    /**
     The response returned with no data.
     */
    case noData
}
