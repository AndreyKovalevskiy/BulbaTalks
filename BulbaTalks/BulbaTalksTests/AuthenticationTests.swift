@testable import BulbaTalks
import XCTest

class AuthenticationTests: XCTestCase {
    /**
     Keys associated with values in the current user‘s defaults
     database.
     */
    private enum UserDefaultsKey {
        /**
         Key to access the value of the boolean flag
         indicating whether the user is signed in.
         */
        static let isSignedIn = "isSignedIn"
    }

    func testIsSignedInPropertyIsInitializedWithTrueWhenUserDefaultsHasTrueIsSignedInKey() {
        // Given
        let expectedIsSignedIn = true

        // When
        UserDefaults.standard.set(true, forKey: UserDefaultsKey.isSignedIn)

        // Then
        let isSignedIn = Authentication.isSignedIn
        XCTAssertEqual(isSignedIn, expectedIsSignedIn)
    }

    func testIsSignedInPropertyIsInitializedWithFalseWhenUserDefaultsHasEmptyIsSignedInKey() {
        // Given
        let expectedIsSignedIn = false

        // When
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.isSignedIn)

        // Then
        let isSignedIn = Authentication.isSignedIn
        XCTAssertEqual(isSignedIn, expectedIsSignedIn)
    }

    func testSignInMethodСhangesIsSignedInProperty() {
        // Given
        let expectedIsSignedIn = true

        // When
        Authentication.signIn { _ in }

        // Then
        let isSignedIn = Authentication.isSignedIn
        XCTAssertEqual(isSignedIn, expectedIsSignedIn)
    }

    func testSignOutMethodСhangesIsSignedInProperty() {
        // Given
        let expectedIsSignedIn = false

        // When
        Authentication.signOut { _ in }

        // Then
        let isSignedIn = Authentication.isSignedIn
        XCTAssertEqual(isSignedIn, expectedIsSignedIn)
    }

    func testSignInMethodСhangesIsSignedInPropertyInUserDefaults() {
        // Given
        let expectedIsSignedIn = true

        // When
        Authentication.signIn { _ in }

        // Then
        let userDefaultsIsSignedIn = UserDefaults.standard.bool(forKey: UserDefaultsKey.isSignedIn)
        XCTAssertNotNil(userDefaultsIsSignedIn)
        XCTAssertEqual(userDefaultsIsSignedIn, expectedIsSignedIn)
    }

    func testSignOutMethodСhangesIsSignedInPropertyInUserDefaults() {
        // Given
        let expectedIsSignedIn = false

        // When
        Authentication.signOut { _ in }

        // Then
        let userDefaultsIsSignedIn = UserDefaults.standard.bool(forKey: UserDefaultsKey.isSignedIn)
        XCTAssertNotNil(userDefaultsIsSignedIn)
        XCTAssertEqual(userDefaultsIsSignedIn, expectedIsSignedIn)
    }
}
