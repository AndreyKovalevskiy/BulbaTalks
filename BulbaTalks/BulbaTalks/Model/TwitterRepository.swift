/**
 A protocol that describes methods for receiving data using
 Twitter API.
 */
protocol TwitterRepository {
    /**
     Returns a collection of tweets posted by the authenticated
     user and the users he is following.
     - Parameters:
       - firstTweet: Controls the amount of tweets to
       receive. If the parameter is not `nil`, then only tweets
       that are more recent than the firstTweet will be received,
       otherwise, the parameter will not affect the receipt of tweets.
       - lastTweet: Controls the amount of tweets to receive.
       If the parameter is not `nil`, then only tweets that are
       older than the lastTweet will be received, otherwise,
       the parameter will not affect the receipt of tweets.
       - completion: A completion handler that takes an
       array of `Tweet` objects as a parameter if  tweets
       was received; otherwise, an empty array.
     */
    func getHomeTimeline(since firstTweet: Tweet?, until lastTweet: Tweet?, completion: ([Tweet]) -> Void)

    /**
     Returns authenticated user.
     - Parameter completion: A completion handler
     that takes `User` object corresponding to the current
     authenticated user as a parameter, or `nil` if the
     authenticated user was not received.
     */
    func getAuthenticatedUser(completion: (User?) -> Void)
}
