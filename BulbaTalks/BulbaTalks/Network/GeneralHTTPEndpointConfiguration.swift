import Foundation

/**
 General configuration for the requests that are used in the TwitterRepository methods.
 */
struct GeneralHTTPEndpointConfiguration {
    let baseURL: URL
    let commonHeaders: HTTPHeaders = [:]
    
    init(activeRepo: ActiveRepository) {
        switch activeRepo {
        case .mock:
            baseURL = Bundle.main.bundleURL
        case .web:
            baseURL = URL(string: "https://api.twitter.com/")!
        }
    }
}
