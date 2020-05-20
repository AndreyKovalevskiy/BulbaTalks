import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var user: User?
    var tweets: [Tweet]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let nib = UINib(nibName: "ListOfTweetsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tweetCellID")

        user = User(id: 12, idString: "12", name: "Preya",
                              screenName: "Preya", description: "", followersCount: 13, friendsCount: 20,
                              createdAt: Date(), profileImageURLString: "test", isProfileContainsDefaultBackground: true,
                              isProfileContainsDefaultImage: true)
        tweets?.append(Tweet(id: 1, idString: "1", createdAt: Date(),
                             text: "New tweet about something interesting. New tweet about something interesting. New tweet about something interesting. New tweet about something interesting.",
                             user: user!, entities: TweetEntities(), retweetCount: 12, favoriteCount: 34, isRetweeted: false,
                             isFavorited: true))
        tweets?.append(Tweet(id: 2, idString: "2", createdAt: Date(),
                             text: "New 22 tweet about 22 something interesting. New tweet 22 about something interesting. New tweet about something interesting. New tweet about something.",
                             user: user!, entities:  TweetEntities(), retweetCount: 12, favoriteCount: 34, isRetweeted: false, isFavorited: true))

        //view1.isHidden = true
    }


    @IBAction func toggleOrange(_ sender: Any) {
      //  view1.isHidden = !view1.isHidden
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        if(section == 1) {
            title = "Tweets"
        }
        return title
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return tweets?.count ?? 0
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "profileCellID",
                                                           for: indexPath) as? ProfileTableViewCell else {
                return UITableViewCell()
            }
            guard let user = self.user else { return cell}
            cell.userNameLabel.text = user.name
            cell.avatarImageView.image = UIImage(named: user.profileImageURLString)
            cell.backgroundImageView.image = UIImage(named: user.profileImageURLString)
            cell.userUrlLabel.text = user.idString
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCellID",
                                                           for: indexPath) as? TweetTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }

    }

}

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userUrlLabel: UILabel!


    @IBAction func profileButtonAction(_ sender: Any) {
    }
}

class TweetTableViewCell: UITableViewCell {

}
