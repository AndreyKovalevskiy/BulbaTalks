import Foundation
/**
 The class making networking calls.
 */
class NetworkService {
    typealias CompletionHandler = (Result<Data?, Error>) -> Void
/**
     The function creates a task that retrieves the contents of the specified URL, then calls a handler upon completion.
     - Parameters: URLRequest, Completion Handler.
     - Returns: The new session data task.
*/
    private func networkRequest(request: URLRequest,
                                completion: @escaping CompletionHandler) -> URLSessionTask {
        let networkTask = URLSession.shared.dataTask(with: request) { (data, response, requestError) in
            if let requestError = requestError {
                completion(.failure(requestError))
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    return
            }
            completion(.success(data))
        }
        networkTask.resume()
        
        return networkTask
    }
}
