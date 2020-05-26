import Foundation
/**
 An object that makes network calls.
 */
class NetworkService {
    typealias CompletionHandler = (Result<Data, Error>) -> Void
/**
     Creates a task that retrieves the contents of the specified URL,
     then calls a handler upon completion.
     - Parameters:
        - request: The URLRequest to be retrived.
        - completion: The completion handler to call when the load request
     is complete. This completion handler takes the following parameters:
            - data: The data returned by the server, or nil if the request was fail.
            - response:  An object that provides HTTP headers and status code.
            - error:  An error object that indicates why the request failed,
            or nil if the request was successful.
     
     - Returns: The new session data task.
*/
    private func networkRequest(request: URLRequest,
                                completion: @escaping CompletionHandler) -> URLSessionTask {
        let networkTask = URLSession.shared.dataTask(with: request) { (data, response, requestError) in
            if let requestError = requestError {
                completion(.failure(requestError))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    return
            }
            if let data = data {
                completion(.success(data))
            }
        }
        networkTask.resume()
        
        return networkTask
    }
}
