import Foundation

/**
The structure contains properties required to create a valid `URLRequest` for receiving data using
Twitter API.
*/
struct RemoteNetworkConfiguration: NetworkConfiguration {
    var baseURL: URL = URL(string: "https://api.twitter.com/")!
    var commonHeaders: HTTPHeaders = [:]
}
