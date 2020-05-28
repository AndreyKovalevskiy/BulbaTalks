/// An object which describes network error.
enum NetworkError: Error {
    /// Describes a network error with a specific status code.
    case error(statusCode: Int)
    /// Describes a network error with a custom description.
    case otherError(message: String)
    
    var description: String {
        switch self {
        case .error(let statusCode):
            return "The call failed with HTTP code \(statusCode)."
        case .otherError(let message):
            return "The call failed with message \(message)"
        }
    }
}
