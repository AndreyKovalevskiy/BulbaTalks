import Foundation

struct Tweet: Codable {
    let id: Int
    let idString: String
    let createdAt: Date
    let text: String
    let user: User
    let entities: TweetEntities
    let retweetCount: Int
    let favoriteCount: Int
    let isTweetRetweeted: Bool
    let isTweetFavorited: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case idString = "id_str"
        case createdAt = "created_at"
        case text
        case user
        case entities
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
        case isTweetRetweeted = "retweeted"
        case isTweetFavorited = "favorited"
    }
}
