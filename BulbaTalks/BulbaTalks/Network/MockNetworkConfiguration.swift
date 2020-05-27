import Foundation

struct MockNetworkConfiguration: NetworkConfiguration {
    var baseURL: URL = Bundle.main.bundleURL
    var commonHeaders: HTTPHeaders = [:]
}
