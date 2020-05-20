/**
 A protocol that describes methods for both receiving data provided by the Twitter API and for receiving mock data
 of the corresponding Twitter API.
 */
protocol Repository {
    /**
     Returns a collection of tweets and retweets posted by the authenticated user and the users he is following.
     - Parameters:
       - firstTweet: The tweet object. If the parameter is not `nil`, then only tweets that are more recent than
       the firstTweet will be received, otherwise, the parameter will not affect the receipt of tweets.
       - lastTweet: The tweet object. If the parameter is not `nil`, then only tweets that are more later than
       the lastTweet will be received, otherwise, the parameter will not affect the receipt of tweets.
       - completion: The completion handler to call when the request for receiving of tweets is complete.
     
         This completion handler takes the following parameter:

         **[Tweet]**

         The array of the received tweets if the request completed successfully and the tweets were received,
         otherwise, an empty array.
     */
    func getHomeTimeline(since firstTweet: Tweet?, until lastTweet: Tweet?, completion: ([Tweet]) -> Void)
    
    /**
     Returns authenticated user.
     - Parameter completion: The completion handler to call when the request for receiving the user is complete.
     
       This completion handler takes the following parameter:
     
       **User**
     
       A user if the request completed successfully and the user was received, otherwise, `nil`.
     */
    func getAuthenticatedUser(completion: (User?) -> Void)
}
