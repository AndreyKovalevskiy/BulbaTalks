import Foundation

/**
 A protocol contains properties required to create a valid `URLRequest`.
 */
protocol NetworkConfiguration {
    /// A value that identifies the location of a resource for receiving data.
    var baseURL: URL { get }
    /// A value that contains HTTP headers.
    var commonHeaders: HTTPHeaders { get }
}
