import Foundation

/**
 Describes the methods associated with authentication on
 Twitter (sign in, sign out) and the current status of user
 authentication (authenticated or not).
 */
struct Authentication {
    /**
     The key to get the current user authentication status
     from `UserDefaults`.
     */
    private static let signInStatusKey = "isSignedIn"

    /// A boolean flag indicating whether the user is authenticated.
    private(set) static var isSignedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: signInStatusKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: signInStatusKey)
        }
    }

    /**
     Performs user authentication process.
     - Parameter completion: A completion handler that
     takes a boolean flag as a parameter. It is `true` when
     the user was authenticated and `false` otherwise.
     */
    static func singIn(completion: (Bool) -> Void) {
        if !isSignedIn {
            isSignedIn = true
        }
        completion(isSignedIn)
    }

    /**
     Performs user sign out process.
     - Parameter completion: A completion handler that
     takes a boolean flag as a parameter. It is `true` when
     the user signed out and `false` otherwise.
     */
    static func singOut(completion: (Bool) -> Void) {
        if isSignedIn {
            isSignedIn = false
        }
        completion(!isSignedIn)
    }
}
