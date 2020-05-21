import UIKit

extension UIImage {
    static func getImage(fromUrl url: String, completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: url) {
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                completion(image)
            }
        }
        completion(nil)        
    }
}
