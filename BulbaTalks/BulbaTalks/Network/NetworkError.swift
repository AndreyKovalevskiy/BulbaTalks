import Foundation

// An object which describe network error.
enum NetworkError: Error {
    // Describes server error which contains Integer value.
    case error(statusCode: Int)
    // Describes other error which contains String value.
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
