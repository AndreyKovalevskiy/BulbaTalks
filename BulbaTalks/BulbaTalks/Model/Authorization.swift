import Foundation

/**
 Coordinates a group of tasks related to authorization
 on Twitter.
 */
struct Authorization {
    /// A list of possible user authorization states.
    enum AuthorizationStatus {
        case authorized
        case deauthorized
    }
    
    /// Indicates whether the user is authorized.
    static private(set) var isSignedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isSignedIn")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isSignedIn")
        }
    }

    /**
     Performs user authorization process.
     - Parameter completion: A completion handler that
     takes `true` as a parameter if the user was authorized,
     otherwise `false`.
     */
    static func authorize(completion: (Bool) -> Void) {
        isSignedIn = true
        completion(true)
    }

    /**
    Performs a change in user authorization status.
    - Parameter newStatus: A new authorization status
    that will be set for the user.
    */
    static func changeAuthorizationStatus(newStatus: Authorization.AuthorizationStatus) {
        isSignedIn = (newStatus == .authorized)
    }
}
