import Foundation

/**
 Contains the necessary properties to create a valid `URLRequest`.
 */
protocol NetworkConfiguration {
    /// The primary part of the URL.
    /// After it follows a variable part of the URL, defined by `HTTPEndpoint`.
    var baseURL: URL { get }
    /// Headers that are used in all `URLRequest`.
    var commonHeaders: HTTPHeaders { get }
}
