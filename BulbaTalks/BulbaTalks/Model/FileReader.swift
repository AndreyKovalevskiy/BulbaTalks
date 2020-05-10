import Foundation

struct FileReader {
    static func read(at filePath: URL) -> Data? {
        guard let url = Bundle.main.url(forResource: filePath.lastPathComponent, withExtension: nil) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
