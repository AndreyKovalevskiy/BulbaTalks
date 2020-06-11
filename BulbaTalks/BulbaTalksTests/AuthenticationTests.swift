@testable import BulbaTalks
import XCTest

class AuthenticationTests: XCTestCase {
    var authentication: Authentication!

    override func setUp() {
        super.setUp()
        authentication = Authentication()
    }

    override func tearDown() {
        authentication = nil
        super.tearDown()
    }

    /**
     Keys associated with values in the current user‘s defaults
     database.
     */
    private enum UserDefaultsKey {
        static let isSignedIn = "isSignedIn"
    }

    func testAuthenticationIsInitializedWithFalseWhenUserDefaultsHasEmptyIsSignedInKey() {
        // Given
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.isSignedIn)
        let authentication = Authentication.isSignedIn

        // When
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.isSignedIn)

        // Then
        XCTAssert(authentication == false)
    }

    func testAuthenticationIsInitializedWithTrueWhenUserDefaultsHasTrueIsSignedInKey() {
        // Given
        UserDefaults.standard.set(true, forKey: UserDefaultsKey.isSignedIn)
        let authentication = Authentication.isSignedIn

        // When
        UserDefaults.standard.set(true, forKey: UserDefaultsKey.isSignedIn)

        // Then
        XCTAssert(authentication == true)
    }

    func testAuthenticationChanges() {
        // Given
        Authentication.signIn { _ in true }

        // When

        // Then
    }
}
