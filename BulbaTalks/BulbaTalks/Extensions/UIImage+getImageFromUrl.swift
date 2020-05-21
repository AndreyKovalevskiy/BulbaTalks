import UIKit

extension UIImage {
    /**
      Function to getting UIImage from url.
      - parameter from: Image url.
      - parameter completion: Escaping closure.
     */
    static func getImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil,
                    let httpResponse = response as? HTTPURLResponse,
                    (200 ... 299).contains(httpResponse.statusCode),
                    let mimeType = httpResponse.mimeType, mimeType.hasPrefix("image/"),
                    let data = data,
                    let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        completion(image)
                    }
                }
            }
            task.resume()
        }
    }
}
