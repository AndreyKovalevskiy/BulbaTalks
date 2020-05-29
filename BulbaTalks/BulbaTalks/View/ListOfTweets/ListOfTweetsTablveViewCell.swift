import UIKit

class ListOfTweetsTableViewCell: UITableViewCell {
    // MARK: Properties

    @IBOutlet var userImage: UserImage!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userIdenticalName: UILabel!
    @IBOutlet var tweetCreatedAt: UILabel!
    @IBOutlet var tweetContent: UILabel!
    @IBOutlet var tweetURL: UILabel!
    @IBOutlet var tweetMedia: TweetMediaImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: Actions

    @IBAction func commentTweet(_: UIButton) {}

    @IBAction func retweet(_: UIButton) {}

    @IBAction func favouriteTweet(_: UIButton) {}
}
