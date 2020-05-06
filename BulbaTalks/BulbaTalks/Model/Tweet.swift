import Foundation

struct Tweet: Codable {
    let id: Int
    let idString: String
    let createdAt: Date
    let text: String
    let user: User
    let entities: [TweetEntity]
    let retweetCount: String
    let likeCount: String
    let isTweetLiked: Bool
    let isTweetRetweeted: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case idString = "id_str"
        case createdAt = "created_at"
        case text
        case user
        case entities
        case retweetCount = "retweet_count"
        case likeCount = "favorite_count"
        case isTweetLiked = "favorited"
        case isTweetRetweeted = "retweeted"
    }
}
