import Foundation

/**
 Contains the necessary properties to create a valid `URLRequest`
 that are used to receive data using Twitter API.
 */
struct RemoteNetworkConfiguration: NetworkConfiguration {
    var baseURL: URL = URL(string: "https://api.twitter.com/")!
    var commonHeaders: HTTPHeaders = [:]
}
