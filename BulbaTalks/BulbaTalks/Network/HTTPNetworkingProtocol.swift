import Foundation

protocol HTTPNetworking {
    typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void
    
    func httpRequest(apiEndpoint: HTTPRequestable, completion: @escaping CompletionHandler) -> URLSessionTask?
}
