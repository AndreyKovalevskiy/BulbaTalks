@testable import BulbaTalks
import XCTest

class AuthenticationTests: XCTestCase {
    /**
     Contains keys used to access data in UserDefaults.
     */
    private enum UserDefaultsKeys {
        /**
         Key to access the value of the boolean flag
         indicating whether the user is signed in.
         */
        static let isSignedIn = "isSignedIn"
    }

    func testIsSignedInPropertyReturnsTrueWhenUserDefaultsHasTrueValueForSignedInKey() {
        // Given
        let expectedAuthorizationStatus = true

        // When
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isSignedIn)

        // Then
        XCTAssertEqual(Authentication.isSignedIn, expectedAuthorizationStatus)
    }

    func testIsSignedInPropertyReturnsFalseWhenUserDefaultsHasEmptyValueForSignedInKey() {
        // Given
        let expectedAuthorizationStatus = false

        // When
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.isSignedIn)

        // Then
        XCTAssertEqual(Authentication.isSignedIn, expectedAuthorizationStatus)
    }

    func testSignInMethodSetsIsSignedInPropertyToTrue() {
        // Given
        let expectedAuthorizationStatus = true

        // When
        Authentication.signIn { _ in }

        // Then
        XCTAssertEqual(Authentication.isSignedIn, expectedAuthorizationStatus)
    }

    func testSignOutMethodSetsIsSignedInPropertyToFalse() {
        // Given
        let expectedAuthorizationStatus = false

        // When
        Authentication.signOut { _ in }

        // Then
        XCTAssertEqual(Authentication.isSignedIn, expectedAuthorizationStatus)
    }

    func testSignInMethodStoresSignedInStatusInUserDefaults() {
        // Given
        let expectedAuthorizationStatus = true

        // When
        Authentication.signIn { _ in }

        // Then
        let signedInStoredStatus = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isSignedIn)
        XCTAssertNotNil(signedInStoredStatus)
        XCTAssertEqual(signedInStoredStatus, expectedAuthorizationStatus)
    }

    func testSignOutMethodStoresSignedInStatusInUserDefaults() {
        // Given
        let expectedAuthorizationStatus = false

        // When
        Authentication.signOut { _ in }

        // Then
        let signedInStoredStatus = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isSignedIn)
        XCTAssertNotNil(signedInStoredStatus)
        XCTAssertEqual(signedInStoredStatus, expectedAuthorizationStatus)
    }

    func testIsSignedInPropertyReturnsFalseWhenUserDefaultsHasInvalidValueForSignedInKey() {
        // Given
        let expectedAuthorizationStatus = false

        // When
        UserDefaults.standard.set("InvalidValue", forKey: UserDefaultsKeys.isSignedIn)

        // Then
        XCTAssertEqual(Authentication.isSignedIn, expectedAuthorizationStatus)
    }

    func testIsSignedInPropertyReturnsTrueWhenSignInMethodCallsSequentially() {
        // Given
        let expectedAuthorizationStatus = true

        // When
        Authentication.signIn { _ in }
        Authentication.signIn { _ in }

        // Then
        XCTAssertEqual(Authentication.isSignedIn, expectedAuthorizationStatus)
    }
}
