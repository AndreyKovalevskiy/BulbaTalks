import Foundation

protocol GeneralDataSourceConfiguration {
    var baseURL: URL { get }
    var commonHeaders: HTTPHeaders { get }
    var commonQueryParameters: HTTPQueryParameters { get }
}
