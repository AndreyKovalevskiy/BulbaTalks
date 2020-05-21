/**
 A protocol that describes methods for both receiving data provided
 by the Twitter API and for receiving mock data of the corresponding
 Twitter API.
 */
protocol Repository {
    /**
     Returns a collection of tweets and retweets posted by
     the authenticated user and the users he is following.
     - Parameters:
       - firstTweet: The `Tweet` object. If the parameter
       is not `nil`, then only tweets that are more recent than
       the firstTweet will be received, otherwise, the parameter
       will not affect the receipt of tweets.
       - lastTweet: The `Tweet` object. If the parameter
       is not `nil`, then only tweets that are earlier than
       the lastTweet will be received, otherwise, the parameter
       will not affect the receipt of tweets.
       - completion: A closure that takes an array of
       `Tweet` objects as a parameter if receiving the tweets
       is successful; otherwise, an empty array.
     */
    func getHomeTimeline(since firstTweet: Tweet?, until lastTweet: Tweet?, completion: ([Tweet]) -> Void)

    /**
     Returns authenticated user.
     - Parameter completion: A closure that takes
     `User` object corresponding to the current authenticated
     user as a parameter, or `nil` if the authenticated user
     was not received.
     */
    func getAuthenticatedUser(completion: (User?) -> Void)
}
