import Foundation

/**
 Coordinates a group of tasks related to authorization
 on Twitter.
 */
struct Authorization {
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
        completion(isSignedIn)
    }

    /**
     Performs user deauthorization process.
     - Parameter completion: A completion handler that
     takes `true` as a parameter if the user was deauthorized,
     otherwise `false`.
     */
    static func singOut(completion: (Bool) -> Void) {
        isSignedIn = false
        completion(!isSignedIn)
    }
}
