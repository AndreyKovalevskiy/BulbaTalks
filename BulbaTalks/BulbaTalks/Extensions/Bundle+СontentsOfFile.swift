import Foundation

extension Bundle {
    /**
     Returns the contents of the resource file using URL.
     - Parameter fileURL: The path to the resource file.
     - Returns: Contents of the resource file or
     `nil` if the file could not be located.
     */
    func contentsOfFile(at fileURL: URL) -> Data? {
        guard let url = url(forResource: fileURL.lastPathComponent,
                                 withExtension: nil) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
