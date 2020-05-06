struct User: Codable {
    let id: Int
    let idString: String
    let name: String
    let screenName: String
    let userDescription: String
    let followersCount: Int
    let friendsCount: Int
    let createdAt: String
    let profileImageURL: String
    let defaultProfile: Bool
    let defaultProfileImage: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case idString = "id_str"
        case name
        case screenName = "screen_name"
        case userDescription = "description"
        case followersCount = "followers_count"
        case friendsCount = "friends_count"
        case createdAt = "created_at"
        case profileImageURL = "profile_image_url_https"
        case defaultProfile = "default_profile"
        case defaultProfileImage = "default_profile_image"
    }
}
