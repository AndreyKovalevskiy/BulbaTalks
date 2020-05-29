import Foundation

/**
 Describes the methods associated with authentication on
 Twitter (sign in, sign out) and the current status of user
 authentication (authenticated or not).
 */
struct Authentication {
    /**
     Stores the key used to obtain the current authentication
     status of the user from `UserDefaults`.
     */
    private enum UserDefaultsKey {
        static let isSignedIn = "isSignedIn"
    }

    /// A boolean flag indicating whether the user is signed in.
    private(set) static var isSignedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKey.isSignedIn)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.isSignedIn)
        }
    }

    /**
     Performs user authentication process.
     - Parameter completion: A completion handler that
     takes a boolean flag as a parameter. It is `true` when
     the authentication is successfully completed  or the user
     is already authenticated; otherwise - `false`.
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
     the sign out is successfully completed or the user already
     signed out; otherwise - `false`.
     */
    static func singOut(completion: (Bool) -> Void) {
        if isSignedIn {
            isSignedIn = false
        }
        completion(!isSignedIn)
    }
}
