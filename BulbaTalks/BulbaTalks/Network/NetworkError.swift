/// An object which describe network error.
enum NetworkError: Error {
    /// Describes a specific network error status code.
    case error(statusCode: Int)
    /// Describes a custom network error message.
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
