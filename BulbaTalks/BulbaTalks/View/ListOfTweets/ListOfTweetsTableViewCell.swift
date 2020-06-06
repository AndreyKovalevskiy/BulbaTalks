import UIKit

class ListOfTweetsTableViewCell: UITableViewCell {
    // MARK: IBOutlet

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userIdenticalNameLabel: UILabel!
    @IBOutlet var tweetCreatedAtLabel: UILabel!
    @IBOutlet var tweetContentLabel: UILabel!
    @IBOutlet var tweetURLLabel: UILabel!
    @IBOutlet var tweetMediaImageView: RoundedImageView!
    @IBOutlet var numberOfCommentsLabel: UILabel!
    @IBOutlet var numberOfRetweetsLabel: UILabel!
    @IBOutlet var numberOfFavouritesLabel: UILabel!

    // MARK: IBAction

    @IBAction func openAccount(_: UIButton) {}

    @IBAction func commentTweet(_: UIButton) {}

    @IBAction func retweet(_: UIButton) {}

    @IBAction func favouriteTweet(_: UIButton) {}
}
