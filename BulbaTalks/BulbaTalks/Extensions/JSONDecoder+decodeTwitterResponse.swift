import Foundation

extension JSONDecoder {
    func decodeTwitterResponse<T: Decodable>(type: [T].Type,
                                             from dataResponse: Data) throws -> [T] {
        let oldDateDecodingStrategy = self.dateDecodingStrategy
        defer { self.dateDecodingStrategy = oldDateDecodingStrategy }
        do {
            self.dateDecodingStrategy = .formatted(.twitter)
            return try self.decode(type, from: dataResponse)
        } catch {
            throw error
        }
    }
}
