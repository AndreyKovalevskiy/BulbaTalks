import Foundation

class FileReader {
    static func readLocalJSONFile(from filename: String) -> Data? {
        do {
            if let path = Bundle.main.path(forResource: filename, ofType: "json"),
                let jsonData = try String(contentsOfFile: path).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        print("Error reading")
        return nil
    }
}
