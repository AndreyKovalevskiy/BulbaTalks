/**
 Describes network error.
 */
enum NetworkError: Error {
    /**
     Bad response with a specific HTTP status code that is
     outside the 200...299 range.
     */
    case badResponse(statusCode: Int)
    /**
     The request was not completed due to the reason
     specified in the `description`.
     */
    case failedRequest(description: String)
    /**
     The response has an unexpected type that failed to cast
     to HTTPURLResponse.
     */
    case invalidResponse
    /**
     Failed to get the URL of the request.
     */
    case invalidURL
    /**
     Failed to get the `URLRequest`.
     */
    case invalidURLRequest
    /**
     No data is in the received response.
     */
    case noData
}
