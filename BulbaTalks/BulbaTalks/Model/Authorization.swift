import Foundation

struct Authorization {
    static var isSignedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isSignedIn")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isSignedIn")
        }
    }
}
