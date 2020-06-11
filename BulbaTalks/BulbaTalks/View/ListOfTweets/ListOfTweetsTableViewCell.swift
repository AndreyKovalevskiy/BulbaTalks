import UIKit

class ListOfTweetsTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userIdenticalNameLabel: UILabel!
    @IBOutlet var tweetCreatedAtLabel: UILabel!
    @IBOutlet var tweetContentLabel: UILabel!
    @IBOutlet var tweetURLLabel: UILabel!
    @IBOutlet var tweetMediaImageView: RoundedImageView!
    @IBOutlet var numberOfCommentsLabel: UILabel!
    @IBOutlet var numberOfRetweetsLabel: UILabel!
    @IBOutlet var numberOfFavouritesLabel: UILabel!

    // MARK: - IBAction

    /// Opens the profile of the selected user.
    @IBAction func openAccount(_: UIButton) {}

    /// Allows to leave a comment under a selected tweet .
    @IBAction func commentTweet(_: UIButton) {}

    /// Allows to share a selected tweet publicly with user's followers.
    @IBAction func retweet(_: UIButton) {}

    /// Allows to like/dislike a selected tweet.
    @IBAction func favouriteTweet(_: UIButton) {}
}
