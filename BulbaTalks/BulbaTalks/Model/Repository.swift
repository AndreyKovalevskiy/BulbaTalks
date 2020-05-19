/// A protocol that describes methods for retrieving data provided by the Twitter API.
protocol Repository {
    /**
     Returns a collection of tweets and retweets posted by the authenticating user and the users he follows.
     - Parameters:
       - firstTweet: The tweet object. If the parameter is not nil, tweets with an identifier greater than the identifier of this tweet will be received.
       - lastTweet: The tweet object. If the parameter is not nil, tweets with an identifier less than the identifier of this tweet will be received.
       - completion: The completion handler to call when the receipt of tweets is completed. This completion handler takes an array of tweets as a parameter.
     */
    func getHomeTimeline(since firstTweet: Tweet?, until lastTweet: Tweet?, completion: ([Tweet]) -> Void)
    
    /**
     Returns authenticated user.
     - Parameter completion: The completion handler to call when the receipt of the user is completed. This completion handler accepts the user as a parameter
     if the user was successfully received, otherwise `nil`.
     */
    func getAuthenticatedUser(completion: (User?) -> Void)
}
