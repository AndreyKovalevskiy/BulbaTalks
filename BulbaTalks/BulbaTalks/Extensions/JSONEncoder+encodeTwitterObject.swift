import Foundation

extension JSONEncoder {
    func encodeTwitterObject<T: Encodable>(value: [T]) throws -> Data {
        let oldDateDecodingStrategy = self.dateEncodingStrategy
        defer { self.dateEncodingStrategy = oldDateDecodingStrategy }
        do {
            self.dateEncodingStrategy = .formatted(.twitter)
            return try self.encode(value)
        } catch {
            throw error
        }
    }
}
