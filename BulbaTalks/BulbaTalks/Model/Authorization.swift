import Foundation

struct Authorization {
    static private(set) var isSignedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isSignedIn")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isSignedIn")
        }
    }
    
    static func makeAuth() -> Bool {
        isSignedIn = true
        return true
    }
}
