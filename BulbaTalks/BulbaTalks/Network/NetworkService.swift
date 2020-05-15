import Foundation

class NetworkService {
    
    private let generalConfiguration: GeneralDataSourceConfiguration
    
    init(generalConfiguration: GeneralDataSourceConfiguration){
        self.generalConfiguration = generalConfiguration
    }
    
    private func networkRequest(request: URLRequest, completion: @escaping CompletionHandler) -> URLSessionTask {
    
        let networkTask = URLSession.shared.dataTask(with: request)  { (data, response, requestError) in
            
            if let requestError = requestError, data != nil else {
                completion(.failure(.error(statusCode: statusCode)))
            }
            
            completion(.success(data))
        }
        networkTask.resume()
        
        return networkTask
    }
}
