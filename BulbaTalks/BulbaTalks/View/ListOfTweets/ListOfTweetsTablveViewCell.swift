import UIKit

class ListOfTweetsTableViewCell: UITableViewCell {
    // MARK: Properties
    weak var delegate: ListOfTweetsViewController?
    @IBOutlet weak var userImageButton: UserImageButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userIdenticalName: UILabel!
    @IBOutlet weak var tweetCreatedAt: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var tweetURL: UILabel!
    @IBOutlet weak var tweetMedia: TweetMediaImageView!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var retweetView: UIView!
    @IBOutlet weak var favouriteView: UIView!
    var isTweetFavorited: Bool?
    var isTweetRetweeted: Bool?
    var userID: Int?
    var tweetID: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        configureTableViewCell()
    }

    // MARK: Private func
    private func configureTableViewCell() {
        configureCommentView()
        configureRetweetView()
        configureFavouriteView()
    }

    private func configureCommentView() {
        let subView = getViewWithImageAndLabel()
        subView?.textCout = "10"
        subView?.imageButton.image = UIImage(named: "comment")
        subView?.actionButton.addTarget(self, action: #selector(commentTweet), for: .touchUpInside)
        subView!.frame = CGRect(origin: CGPoint.zero, size: self.commentView.frame.size)

        self.commentView.insertSubview(subView!, at: 0)
    }

    private func configureRetweetView() {
        let subView = getViewWithImageAndLabel()
        subView?.textCout = "9"
        subView?.imageButton.image = UIImage(named: "unretweet")
        subView?.actionButton.addTarget(self, action: #selector(retweet), for: .touchUpInside)
        subView!.frame = CGRect(origin: CGPoint.zero, size: self.retweetView.frame.size)

        self.retweetView.insertSubview(subView!, at: 0)
    }

    private func configureFavouriteView() {
        let subView = getViewWithImageAndLabel()
        subView?.textCout = "12"
        subView?.imageButton.image = UIImage(named: "unfavourite")
        subView?.actionButton.addTarget(self, action: #selector(favouriteTweet), for: .touchUpInside)
        subView!.frame = CGRect(origin: CGPoint.zero, size: self.favouriteView.frame.size)

        self.favouriteView.insertSubview(subView!, at: 0)
    }

    private func getViewWithImageAndLabel() -> ViewWithImageAndLabel? {
        return Bundle.main.loadNibNamed("ViewWithImageAndLabel", owner: self, options: nil)?[0] as? ViewWithImageAndLabel
    }

    private func openTweet(tweetID: Int) {}

    private func openURLTweet(urlTweet: String) {}

    // MARK: Actions
    @IBAction func openUserAccount(_ sender: UIButton) {}

    @objc func commentTweet(sender: UIButton!) {}

    @objc func retweet(sender: UIButton!) {}

    @objc func favouriteTweet(sender: UIButton!) {}
}
