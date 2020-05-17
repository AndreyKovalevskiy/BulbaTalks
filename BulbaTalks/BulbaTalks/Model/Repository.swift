protocol Repository {
    /// Returns a collection of tweets and retweets posted by the authenticating user and the users he follows
    /// - Parameters:
    ///   - firstTweet: The tweet to get more recent tweets
    ///   - lastTweet: The tweet to get more older tweets
    ///   - completion: A closure that accepts an array of tweets
    func getHomeTimeline(since firstTweet: Tweet?, until lastTweet: Tweet?, completion: ([Tweet]) -> Void)
}
