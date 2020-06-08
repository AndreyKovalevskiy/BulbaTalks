/// Describes network error.
enum NetworkError: Error {
    case badNetworkConection
    case clientError
    case failedRequest
    case invalidResponse
    case invalidURL
    case invalidURLRequest
    case noData
    case serverError

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
