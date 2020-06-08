import Foundation

/**
 Describes the methods for receiving data using Twitter API.
 */
struct TwitterDataSource {
    /**
     Network service that we use to make requests to the Twitter API.
     */
    private let networkService: NetworkService = NetworkService(networkConfiguration: Settings.shared.activeNetworkConfiguration)

    /**
     Receives a collection of tweets posted by the authenticated
     user and the users he is following.

     Method returns up to 20 tweet items from the Twitter home
     timeline using the interval formed by the `firstTweet` and/or
     `lastTweet` parameters.
     If we have both parameters are `nil`, then we will get the 20
     newest tweets from the home timeline.
     - Parameters:
       - firstTweet: A tweet, starting from which (not including
       this tweet) we get the home timeline array with the newest
       tweets.
       - lastTweet: A tweet, starting from which (including this
       tweet) we get the home timeline array with the tweets older
       than that.
       - completion: A completion handler that takes an array
       of `Tweet` objects, this array may contain tweets when
       successfully recieved the home timeline and may be empty,
       in case of an error while receiving tweets, or requesting new
       tweets, when there are no new tweets in the Twitter home
       timeline.
     */
    public func getHomeTimeline(since firstTweet: Tweet?,
                                until lastTweet: Tweet?,
                                completion: @escaping ([Tweet]) -> Void) {
        var queryParameters = HTTPQueryParameters()
        queryParameters["since_id"] = firstTweet?.idString
        queryParameters["max_id"] = lastTweet?.idString

        let apiEndpoint = APIEndpoints.getHomeTimeline(with: [:], queryParameters: queryParameters)

        networkService.httpRequest(apiEndpoint: apiEndpoint) { result in
            switch result {
            case .failure:
                completion([])
            case let .success(data):
                if let tweetsArray = try? JSONDecoder().decodeTwitterResponse([Tweet].self, from: data) {
                    completion(tweetsArray)
                } else {
                    completion([])
                }
            }
        }
    }

    /**
     Gets an authenticated user.
     - Parameter completion: A completion handler that
     takes `User` object corresponding to the current authenticated
     user as a parameter, or `nil` if the authenticated user was
     not received.
     */
    public func getAuthenticatedUser(completion: @escaping (User?) -> Void) {
        let apiEndpoint = APIEndpoints.getAuthenticatedUser(with: [:])

        networkService.httpRequest(apiEndpoint: apiEndpoint) { result in
            switch result {
            case .failure:
                completion(nil)
            case let .success(data):
                if let userArray = try? JSONDecoder().decodeTwitterResponse([User].self, from: data),
                    let user = userArray.first {
                    completion(user)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
