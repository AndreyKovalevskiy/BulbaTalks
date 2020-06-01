/// Describes network error.
enum NetworkError: Error {
    /// Describes a network error with a specific status code.
    case error(statusCode: Int)
    
    var description: String {
        switch self {
        case .error(let statusCode):
            return "The call failed with HTTP code \(statusCode)."
        }
    }
}
