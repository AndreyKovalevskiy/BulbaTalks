@testable import BulbaTalks
import XCTest

class AuthenticationTests: XCTestCase {
    let authentication = Authentication.isSignedIn

    func testAuthenticationAfterInitialzedWhen() {
        // Given
        let expectedAuth = false

        // When
        let auth = Authentication.isSignedIn

        // Then
        XCTAssertEqual(auth, expectedAuth)
    }
}
