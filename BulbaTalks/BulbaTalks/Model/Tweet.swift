import Foundation

struct Tweet: Codable {
    let id: Int
    let idString: String
    let createdAt: Date
    let text: String
    let user: User
    let entity: TweetEntity
    let retweetCount: Int
    let likeCount: Int
    let isTweetLiked: Bool
    let isTweetRetweeted: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case idString = "id_str"
        case createdAt = "created_at"
        case text
        case user
        case entity
        case retweetCount = "retweet_count"
        case likeCount = "favorite_count"
        case isTweetLiked = "favorited"
        case isTweetRetweeted = "retweeted"
    }
}
