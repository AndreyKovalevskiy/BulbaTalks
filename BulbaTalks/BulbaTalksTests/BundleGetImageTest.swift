@testable import BulbaTalks
import XCTest

class BundleGetImageTest: XCTestCase {
    func testGetImageMethodWhenCorrectUrlAndReceiveImageNotNil() {
        // arrange
        let correctUrl = URL(fileURLWithPath: "twitterProfileImage.jpg")
        let expectation = XCTestExpectation(description: "Image not received.")

        // act
        var imageByUrl: UIImage?
        Bundle.main.getImage(at: correctUrl) { image in
            imageByUrl = image
            expectation.fulfill()
        }

        // assert
        wait(for: [expectation], timeout: 5.0)
        XCTAssertNotNil(imageByUrl)
    }

    func testGetImageMethodWithNonexistentImageUrlRecieveImageIsNil() {
        // arrange
        let nonexistentUrl = URL(fileURLWithPath: "123nonexistentImage.jpg")
        let expectation = XCTestExpectation(description: "Image not received.")

        // act
        var imageByUrl: UIImage?
        Bundle.main.getImage(at: nonexistentUrl) { image in
            imageByUrl = image
            expectation.fulfill()
        }

        // assert
        wait(for: [expectation], timeout: 5.0)
        XCTAssertNil(imageByUrl)
    }

    func testGetImageMethodWithEmptyStringImageUrlRecieveImageIsNil() {
        // arrange
        let emptyStringUrl = URL(fileURLWithPath: String())
        let expectation = XCTestExpectation(description: "Image not received.")

        // act
        var imageByUrl: UIImage?
        Bundle.main.getImage(at: emptyStringUrl) { image in
            imageByUrl = image
            expectation.fulfill()
        }

        // assert
        wait(for: [expectation], timeout: 5.0)
        XCTAssertNil(imageByUrl)
    }
}
