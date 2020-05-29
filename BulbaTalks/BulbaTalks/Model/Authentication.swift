import Foundation

/**
 Manages authentication process (sign in/sign out) and stores
 the current authentication status.
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
     takes `true` as a parameter. A value of `true` means that
     the authentication is successfully completed or the user
     is already authenticated.
     */
    static func signIn(completion: (Bool) -> Void) {
        if !isSignedIn {
            isSignedIn = true
        }
        completion(true)
    }

    /**
     Performs user sign out process.
     - Parameter completion: A completion handler that
     takes `true` as a parameter. A value of `true` means that
     the sign out is successfully completed or the user already
     signed out.
     */
    static func signOut(completion: (Bool) -> Void) {
        if isSignedIn {
            isSignedIn = false
        }
        completion(true)
    }
}
