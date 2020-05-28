import Foundation

/**
 Contains the necessary properties to create a valid `URLRequest`
 that are used to get mocking data.
 */
struct MockNetworkConfiguration: NetworkConfiguration {
    var baseURL: URL = Bundle.main.bundleURL
    var commonHeaders: HTTPHeaders = [:]
}
