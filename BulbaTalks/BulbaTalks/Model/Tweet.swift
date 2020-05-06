import Foundation

struct Tweet {
    let id: Int
    let idStr: String
    let createdAt: String
    let text: String
    let user: User
    let entities: TweetEntities
    let retweetCount: String
    let likeCount: String
    let isTweetLiked: Bool
    let isTweetRetweeted: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case idStr = "id_str"
        case createdAt = "created_at"
        case text, user, entities
        case retweetCount = "retweet_count"
        case likeCount = "favorite_count"
        case isTweetLiked = "favorited"
        case isTweetRetweeted = "retweeted"
    }
}

extension Tweet: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        idStr = try values.decode(String.self, forKey: .idStr)
        createdAt = try values.decode(String.self, forKey: .createdAt)
        text = try values.decode(String.self, forKey: .text)
        user = try values.decode(User.self, forKey: .user)
        entities = try values.decode(TweetEntities.self, forKey: .entities)
        retweetCount = try values.decode(String.self, forKey: .retweetCount)
        likeCount = try values.decode(String.self, forKey: .likeCount)
        isTweetLiked = try values.decode(Bool.self, forKey: .isTweetLiked)
        isTweetRetweeted = try values.decode(Bool.self, forKey: .isTweetRetweeted)
    }
}

extension Tweet: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(idStr, forKey: .idStr)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(text, forKey: .text)
        try container.encode(user, forKey: .user)
        try container.encode(entities, forKey: .entities)
        try container.encode(retweetCount, forKey: .retweetCount)
        try container.encode(likeCount, forKey: .likeCount)
        try container.encode(isTweetLiked, forKey: .isTweetLiked)
        try container.encode(isTweetRetweeted, forKey: .isTweetRetweeted)
    }
}

struct TweetEntities: Codable {
    
}
