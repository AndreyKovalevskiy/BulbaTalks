@testable import BulbaTalks
import XCTest

class BundleTest: XCTestCase {
    // Uses to wait for a function completion.
    var timeoutOfFunctionCompltion: Double
    var getImageExpectationDescriptionText: String

    override func setUp() {
        timeoutOfFunctionCompltion = 5.0
        getImageExpectationDescriptionText = "Image is received."
    }

    func testGetImageMethodReturnsImageIsNotNilWhenCorrectURL() {
        // Given
        let imageURL = URL(fileURLWithPath: "twitterProfileImage.jpg")
        let getImageCompletionExpectation = XCTestExpectation(description: getImageExpectationDescriptionText)

        // When
        var image: UIImage?
        Bundle.main.getImage(at: imageURL) { returnedImage in
            image = returnedImage
            getImageCompletionExpectation.fulfill()
        }

        // Then
        wait(for: [getImageCompletionExpectation], timeout: timeoutOfFunctionCompltion)
        XCTAssertNotNil(image)
    }

    func testGetImageMethodReturnsImageIsNilWhenNonexistentImageURL() {
        // Given
        let nonexistentURL = URL(fileURLWithPath: "123nonexistentImage.jpg")
        let getImageCompletionExpectation = XCTestExpectation(description: getImageExpectationDescriptionText)

        // When
        var image: UIImage?
        Bundle.main.getImage(at: nonexistentURL) { returnedImage in
            image = returnedImage
            getImageCompletionHandlerIsCalledExpectation.fulfill()
        }

        // Then
        wait(for: [getImageCompletionExpectation], timeout: timeoutOfFunctionCompltion)
        XCTAssertNil(image)
    }

    func testGetImageMethodReturnsImageIsNilWhenEmptyStringImageURL() {
        // Given
        let emptyURL = URL(fileURLWithPath: String())
        let getImageCompletionExpectation = XCTestExpectation(description: getImageExpectationDescriptionText)

        // When
        var image: UIImage?
        Bundle.main.getImage(at: emptyURL) { returnedImage in
            image = returnedImage
            getImageCompletionExpectation.fulfill()
        }

        // Then
        wait(for: [getImageCompletionExpectation], timeout: timeoutOfFunctionCompltion)
        XCTAssertNil(image)
    }
}
