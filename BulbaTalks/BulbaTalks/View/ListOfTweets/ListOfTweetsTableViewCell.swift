import UIKit

class ListOfTweetsTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var screenNameLabel: UILabel!
    @IBOutlet var createdAtLabel: UILabel!
    @IBOutlet var tweetTextLabel: UILabel!
    @IBOutlet var tweetURLLabel: UILabel!
    @IBOutlet var tweetMediaImageView: RoundedImageView!
    @IBOutlet var commentCountLabel: UILabel!
    @IBOutlet var retweetCountLabel: UILabel!
    @IBOutlet var favoriteCountLabel: UILabel!

    // MARK: - IBAction

    /// Opens the profile of the user.
    @IBAction func openProfile(_: UIButton) {}

    /// Leaves a comment under a tweet .
    @IBAction func commentTweet(_: UIButton) {}

    /**
     Shares a tweet publicly with followers
     of the currently authenticated user.
     */
    @IBAction func retweet(_: UIButton) {}

    /// Favorites/unfavorites a tweet.
    @IBAction func favoriteTweet(_: UIButton) {}
}
