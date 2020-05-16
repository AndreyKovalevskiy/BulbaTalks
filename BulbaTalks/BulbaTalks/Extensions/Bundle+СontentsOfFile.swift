import Foundation

extension Bundle {
    func contentsOfFile(at fileURL: URL) -> Data? {
        guard let url = url(forResource: fileURL.lastPathComponent,
                                 withExtension: nil) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
