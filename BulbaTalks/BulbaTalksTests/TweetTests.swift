@testable import BulbaTalks
import XCTest

class TweetTests: XCTestCase {
    /// The instance of `User` used during initialization tweet.
    var user: User!
    /// The instance of `TweetEntities` used during initialization tweet.
    var tweetEntities: TweetEntities!

    override func setUp() {
        super.setUp()
        user = User(id: 2_244_994_945,
                    idString: "2244994945",
                    name: "Twitter Dev",
                    screenName: "TwitterDev",
                    description: "Your official source for Twitter Platform news",
                    followersCount: 502_017,
                    friendsCount: 1472,
                    createdAt: Date(),
                    profileImageURLString: "MockedTwitterResponses/images/twitterProfileImage.jpg",
                    isProfileContainsDefaultBackground: true,
                    isProfileContainsDefaultImage: true)
        tweetEntities = TweetEntities()
    }

    override func tearDown() {
        super.tearDown()
        user = nil
        tweetEntities = nil
    }

    func testPublicPropertiesContainExpectedValuesWhenTweetIsInitializedWithGivenParameters() {
        // Given
        let expectedId = 2_085_118_657_991_131_728
        let expectedIdString = "2085118657991131728"
        let expectedCreatedAt = Date()
        let expectedText = "This is realy Twitter API"
        let expectedRetweetCount = 5
        let expectedFavoriteCount = 10
        let expectedIsRetweeted = true
        let expectedIsFavorited = true

        // When
        let tweet = Tweet(id: 2_085_118_657_991_131_728,
                          idString: "2085118657991131728",
                          createdAt: Date(),
                          text: "This is realy Twitter API",
                          user: user,
                          entities: tweetEntities,
                          retweetCount: 5,
                          favoriteCount: 10,
                          isRetweeted: true,
                          isFavorited: true)

        // Then
        let tweetId = tweet.id
        let tweetIdString = tweet.idString
        let tweetCreatedAt = tweet.createdAt
        let tweetText = tweet.text
        let tweetRetweetCount = tweet.retweetCount
        let tweetFavoriteCount = tweet.favoriteCount
        let tweetIsRetweeted = tweet.isRetweeted
        let tweetIsFavorited = tweet.isFavorited

        XCTAssertEqual(tweetId, expectedId)
        XCTAssertEqual(tweetIdString, expectedIdString)
        XCTAssertEqual(tweetCreatedAt, expectedCreatedAt)
        XCTAssertEqual(tweetText, expectedText)
        XCTAssertEqual(tweetRetweetCount, expectedRetweetCount)
        XCTAssertEqual(tweetFavoriteCount, expectedFavoriteCount)
        XCTAssertEqual(tweetIsRetweeted, expectedIsRetweeted)
        XCTAssertEqual(tweetIsFavorited, expectedIsFavorited)
    }
}
