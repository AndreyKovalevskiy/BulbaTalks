import UIKit

extension UIImage {
    static func getImage(fromUrl url: String, completion: @escaping (UIImage?) -> Void) {
        var image: UIImage?
        if let url = URL(string: url) {
            do {
                let data = try Data(contentsOf: url, options: [])
                image = UIImage(data: data)
            } catch {}
        }
        completion(image)
    }
}
