import Foundation

class NetworkClient {
    
    func makeRequest(for operation: TwitterOperation) -> Data? {
        
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.twitter.com"
        components.path = operation.path
        
        if let parameters = operation.parameters {
            for item in parameters {
                components.queryItems?.append(URLQueryItem(name: item.key, value: "\(item.value)"))
            }
        }
        
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = operation.httpMethod
        
        if let headers = operation.headers {
            for item in headers {
                urlRequest.setValue(item.value, forHTTPHeaderField: item.key)
            }
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest)  { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                return
            }
            
            if let data = data {
                print(data)
                return
            }
        }
        task.resume()
        
        return Data()
    }
}
