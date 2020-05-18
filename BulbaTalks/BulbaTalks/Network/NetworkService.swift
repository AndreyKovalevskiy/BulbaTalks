import Foundation
/**
 This singletone class  making networking calls.
 */
class NetworkService {
    typealias CompletionHandler = (Result<Data?, Error>) -> Void
/**
     This func reates a task that retrieves the contents of the specified URL, then calls a handler upon completion.
     - Parameter element: url, completion handler.
     - Returns: The new session data task.
*/
    private func networkRequest(request: URLRequest,
                                completion: @escaping CompletionHandler) -> URLSessionTask {
        let networkTask = URLSession.shared.dataTask(with: request) { (data, response, requestError) in
            if let requestError = requestError, data != nil {
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
