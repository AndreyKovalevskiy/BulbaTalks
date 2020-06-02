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

     This method uses the argument `firstTweet` or
     `lastTweet` to get 20 specific tweets relative to the some
     tweet, if both arguments are `nil`, then this method will return
     20 newest tweets in the user’s home timeline.
     - Parameters:
       - firstTweet: Сontains a tweet, starting from which
       (not including this tweet) we will get the next 20 tweets that
       were made immediately after this tweet (it is possible to get
       less than 20 tweets, because so many new tweets might not
       appear); if the parameter is `nil`, then it will not affect the
       receipt of tweets, with the exception described in the
       discussion section.
       - lastTweet: Contains a tweet starting from which (not
       including this tweet) we will get the next 20 tweets that were
       made right before this tweet (it is possible to get less than 20
       tweets, because theoretically you can get to the oldest
       tweets on the Twitter platform); if the parameter is `nil`,
       then it will not affect the receipt of tweets, with the exception
       described in the discussion section.
       - completion: A completion handler that takes an
       array of `Tweet` objects as a parameter if tweets
       was received; otherwise, an empty array of `Tweet`
       objects.
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
