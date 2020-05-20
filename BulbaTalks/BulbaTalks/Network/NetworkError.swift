import Foundation

// The enum contains cases of network errors
enum NetworkError: Error {
    
    case error(statusCode: Int)
    case serverError(message: String)
    
    var description: String {
        switch self {
        case .error(let statusCode):
            return "The call failed with HTTP code \(statusCode)."
        case .serverError(let message):
            return "The server responded with message \(message)"
        }
    }
}
