import Foundation

protocol TwitterObjectEncoding {
    func encodeTwitterObject<T>(_ value: T) throws -> Data where T: Encodable
}

extension JSONEncoder: TwitterObjectEncoding {
    func encodeTwitterObject<T>(_ value: T) throws -> Data where T: Encodable {
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
