import Foundation

/**
A protocol contains properties required to create a valid `URLRequest`.
 */
protocol NetworkConfiguration {
    var baseURL: URL { get }
    var commonHeaders: HTTPHeaders { get }
}
