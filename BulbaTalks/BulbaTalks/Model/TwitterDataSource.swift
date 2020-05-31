import Foundation

/**
 Describes the methods for receiving data using Twitter API.
 */
struct TwitterDataSource {
    /**
     Network service that we use to make requests to the Twitter API.
     */
    private let networkService: NetworkService = NetworkService(generalConfiguration: Settings.shared.currentConfiguration)

    /**
     Receives a collection of tweets posted by the authenticated
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
       array of `Tweet` objects as a parameter if tweets
       was received; otherwise, an empty array.
     */
    public func getHomeTimeline(since firstTweet: Tweet?, until lastTweet: Tweet?, completion: @escaping ([Tweet]) -> Void) {
        var queryParameters = HTTPQueryParameters()
        queryParameters["since_id"] = firstTweet?.idString
        queryParameters["max_id"] = lastTweet?.idString

        let apiEndpoint = APIEndpoints.getHomeTimeline(with: [:], queryParameters: queryParameters, bodyParameters: [:])

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
     Receives an authenticated user.
     - Parameter completion: A completion handler that
     takes `User` object corresponding to the current authenticated
     user as a parameter, or `nil` if the authenticated user was
     not received.
     */
    public func getAuthenticatedUser(completion: @escaping (User?) -> Void) {
        let apiEndpoint = APIEndpoints.getAuthenticatedUser(with: [:], queryParameters: [:], bodyParameters: [:])

        networkService.httpRequest(apiEndpoint: apiEndpoint) { result in
            switch result {
            case .failure:
                completion(nil)
            case let .success(data):
                if let userArray = try? JSONDecoder().decodeTwitterResponse([User].self, from: data),
                       !userArray.isEmpty
                {
                    completion(userArray.first!)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
