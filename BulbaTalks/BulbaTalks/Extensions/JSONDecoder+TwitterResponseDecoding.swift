import Foundation

protocol TwitterResponseDecoding {
    func decodeTwitterResponse<T>(_ type: T.Type,
                                  from data: Data) throws -> T where T: Decodable
}

extension JSONDecoder: TwitterResponseDecoding {
    func decodeTwitterResponse<T>(_ type: T.Type,
                                  from data: Data) throws -> T where T: Decodable {
        let oldDateDecodingStrategy = self.dateDecodingStrategy
        defer { self.dateDecodingStrategy = oldDateDecodingStrategy }

        do {
            self.dateDecodingStrategy = .formatted(.twitter)
            return try self.decode(type, from: data)
        } catch {
            throw error
        }
    }
}
