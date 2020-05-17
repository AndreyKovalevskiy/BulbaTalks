import Foundation

/// A structure that coordinates a group of tasks related to authorization on Twitter.
struct Authorization {
    
    /// A boolean value indicating whether the user is authorized.
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
     - Returns: `True` if the user was authorized, otherwise `false`.
     */
    static func authorize() -> Bool {
        isSignedIn = true
        return true
    }
    
    /**
     Performs user deauthorization process.
     - Returns: `True` if the user was deauthorized, otherwise `false`.
     */
    static func singOut() -> Bool {
        isSignedIn = false
        return true
    }
}
