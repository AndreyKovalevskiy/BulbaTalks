import Foundation

/**
 Сonfiguration is used to receive mocked data of the corresponding Twitter API.
 Contains properties which are used to make the absolute URL from the given relative URL
 and to make headers for `URLRequest`.
 */
struct MockNetworkConfiguration: NetworkConfiguration {
    var baseURL: URL = Bundle.main.bundleURL
    var commonHeaders: HTTPHeaders = [:]
}
