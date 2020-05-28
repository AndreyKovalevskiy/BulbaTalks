import Foundation

/**
 Contains properties required to create a valid `URLRequest` for receiving mocking data.
 */
struct MockNetworkConfiguration: NetworkConfiguration {
    var baseURL: URL = Bundle.main.bundleURL
    var commonHeaders: HTTPHeaders = [:]
}
