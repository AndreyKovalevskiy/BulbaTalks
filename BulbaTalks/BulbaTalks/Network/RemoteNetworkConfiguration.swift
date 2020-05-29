import Foundation

/**
 Сonfiguration is used to post and receive data provided by the Twitter API.
 Contains properties which are used to make the absolute URL from the given relative URL
 and to make headers for `URLRequest`.
 */
struct RemoteNetworkConfiguration: NetworkConfiguration {
    var baseURL: URL = URL(string: "https://api.twitter.com/")!
    var commonHeaders: HTTPHeaders = [:]
}
