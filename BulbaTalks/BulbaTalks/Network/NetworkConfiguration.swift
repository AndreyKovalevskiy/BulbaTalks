import Foundation

/**
 A protocol contains properties required to create a valid `URLRequest`.
 */
protocol NetworkConfiguration {
    /// A value that contains the consistent component of the URL.
    var baseURL: URL { get }
    /// A value that contains HTTP headers.
    var commonHeaders: HTTPHeaders { get }
}
