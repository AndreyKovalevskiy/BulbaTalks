import UIKit

class ListOfTweetsViewController: UIViewController {
    // MARK: - Properties

    /// List of tweets to display on the screen.
    var tweets = [Tweet]()

    // MARK: - IBOutlet

    @IBOutlet private var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var tabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureTabBar()
        configureTitleViewOfNavigationBar()
        configureLeftBarButtonItem()
        TwitterDataSource().getHomeTimeline { tweets in
            self.tweets = tweets
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            tabBar.frame.size.height = ViewControllerConstants.TabBar.heightInLandscapeOrientation
            tabBar.frame.origin.y = view.frame.height - ViewControllerConstants.TabBar.heightInLandscapeOrientation
        }
    }

    // MARK: - Private functions

    /// Configures `UITableView`.
    private func configureTableView() {
        tableView.registerCell(of: ListOfTweetsTableViewCell.self)
    }

    /// Configures `UITabBar`.
    private func configureTabBar() {
        tabBar.barTintColor = .white
    }

    /// Adds `UIImage` in the title of navigation bar.
    private func configureTitleViewOfNavigationBar() {
        if let logoOfTwitter = UIImage(named: "logoOfTwitter") {
            let twitterLogoImageView = UIImageView(image: logoOfTwitter)
            twitterLogoImageView.contentMode = .scaleAspectFit
            navigationItem.titleView = twitterLogoImageView
        }
    }

    /**
     Adds a rounded left `UIBarButtonItem` with the image
     of the authenticated user.
     */
    private func configureLeftBarButtonItem() {
        let imageFromUserProfile = UIImage(named: "mockedUserImage")
        let barButtonItem = UIButton(frame:
            CGRect(x: 0, y: 0,
                   width: ViewControllerConstants.BarButtonItem.width,
                   height: ViewControllerConstants.BarButtonItem.height))
        barButtonItem.layer.masksToBounds = true
        barButtonItem.layer.cornerRadius = barButtonItem.frame.height / 2
        barButtonItem.setImage(imageFromUserProfile, for: .normal)
        barButtonItem.widthAnchor.constraint(equalToConstant:
            ViewControllerConstants.BarButtonItem.Anchor.width).isActive = true
        barButtonItem.heightAnchor.constraint(equalToConstant:
            ViewControllerConstants.BarButtonItem.Anchor.height).isActive = true
        barButtonItem.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)

        navigationBar.items = [navigationItem]
    }

    // MARK: - IBAction

    /// Opens the profile of the authenticated user.
    @objc func openProfile(_: UIBarButtonItem) {}

    /// Gets a view controller to create a new Tweet.
    @IBAction func composeTweet(_: UIButton) {}
}

// MARK: - Extensions

extension ListOfTweetsViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tweetCell = tableView.dequeueCell(of: ListOfTweetsTableViewCell.self) else {
            return UITableViewCell()
        }
        let tweet = tweets[indexPath.row]
        tweetCell.nameLabel.text = tweet.user.name
        tweetCell.screenNameLabel.text = tweet.user.screenName
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        tweetCell.createdAtLabel.text = formatter.string(from: tweet.createdAt)
        tweetCell.tweetTextLabel.text = tweet.text
        tweetCell.retweetCountLabel.text = String(tweet.retweetCount)
        tweetCell.favoriteCountLabel.text = String(tweet.favoriteCount)
        return tweetCell
    }
}
