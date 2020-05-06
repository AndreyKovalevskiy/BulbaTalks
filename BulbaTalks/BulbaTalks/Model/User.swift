import Foundation

struct User {
    let id: Int
    let idStr, name, screenName: String
    let userDescription: String
    let followersCount, friendsCount: Int
    let createdAt: String
    let profileImageURLHTTPS: String
    let defaultProfile, defaultProfileImage: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case idStr = "id_str"
        case name
        case screenName = "screen_name"
        case userDescription = "description"
        case followersCount = "followers_count"
        case friendsCount = "friends_count"
        case createdAt = "created_at"
        case profileImageURLHTTPS = "profile_image_url_https"
        case defaultProfile = "default_profile"
        case defaultProfileImage = "default_profile_image"
    }
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        idStr = try values.decode(String.self, forKey: .idStr)
        name = try values.decode(String.self, forKey: .name)
        screenName = try values.decode(String.self, forKey: .screenName)
        userDescription = try values.decode(String.self, forKey: .userDescription)
        followersCount = try values.decode(Int.self, forKey: .followersCount)
        friendsCount = try values.decode(Int.self, forKey: .friendsCount)
        createdAt = try values.decode(String.self, forKey: .createdAt)
        profileImageURLHTTPS = try values.decode(String.self, forKey: .profileImageURLHTTPS)
        defaultProfile = try values.decode(Bool.self, forKey: .defaultProfile)
        defaultProfileImage = try values.decode(Bool.self, forKey: .defaultProfileImage)
    }
}

extension User: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(idStr, forKey: .idStr)
        try container.encode(name, forKey: .name)
        try container.encode(screenName, forKey: .screenName)
        try container.encode(userDescription, forKey: .userDescription)
        try container.encode(followersCount, forKey: .followersCount)
        try container.encode(friendsCount, forKey: .friendsCount)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(profileImageURLHTTPS, forKey: .profileImageURLHTTPS)
        try container.encode(defaultProfile, forKey: .defaultProfile)
        try container.encode(defaultProfileImage, forKey: .defaultProfileImage)
    }
}
