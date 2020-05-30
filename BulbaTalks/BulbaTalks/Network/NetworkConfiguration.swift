import Foundation

/**
 Configuration is used to split the work with data into scenarios,
 such as Remote and Mock Network.
 Contains properties which are used to make the absolute URL from the given relative URL
 and to make headers for `URLRequest`.
 */
protocol NetworkConfiguration {
    /**
     The part of the absolute URL which is followed by the relative endpoint URL.
     */
    var baseURL: URL { get }
    /**
     Specifies common headers that are added to all tasks
     within URL sessions based on the active configuration.
     */
    var commonHeaders: HTTPHeaders { get }
}
