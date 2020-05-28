import Foundation

/**
 Describes authorization related methods
 on Twitter (sign in, sign out) and the current status of user
 authorization.
 */
struct Authorization {
    /**
     The key to get the current user authorization status
     from `UserDefaults`.
     */
    private static let signInStatusKey = "isSignedIn"

    /// A boolean flag indicating whether the user is authorized.
    private(set) static var isSignedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: signInStatusKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: signInStatusKey)
        }
    }

    /**
     Performs user authorization process.
     - Parameter completion: A completion handler that
     takes a boolean flag as a parameter. It is `true` when
     the user was authorized and `false` otherwise.
     */
    static func singIn(completion: (Bool) -> Void) {
        if !isSignedIn {
            isSignedIn = true
        }
        completion(isSignedIn)
    }

    /**
     Performs user deauthorization process.
     - Parameter completion: A completion handler that
     takes a boolean flag as a parameter. It is `true` when
     the user was deauthorized and `false` otherwise.
     */
    static func singOut(completion: (Bool) -> Void) {
        if isSignedIn {
            isSignedIn = false
        }
        completion(!isSignedIn)
    }
}
