import Foundation
/**
 An object which makmaking network calls.
 */
class NetworkService {
    typealias CompletionHandler = (Result<Data?, Error>) -> Void
/**
     Creates a task that retrieves the contents of the specified URL,
     then calls a handler upon completion.
     - Parameters:
     URLRequest - the URL to be retrieved.
     Completion Handler - the completion handler to call when the load request is complete.
     This completion handler takes the following parameters: 
            data: the data returned by the server, or nil if the request was fail.
            response: an object that provides HTTP headers and status code.
            error: an error object that indicates why the request failed,
            or nil if the request was successful.
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
