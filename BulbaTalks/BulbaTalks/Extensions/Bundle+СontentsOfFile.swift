import Foundation

extension Bundle {
    func contentsOfFile(at resourceURL: URL) -> Data? {
        guard let url = self.url(forResource: resourceURL.lastPathComponent,
                                 withExtension: nil) else { return nil }
        return try? Data(contentsOf: url)
    }
}
