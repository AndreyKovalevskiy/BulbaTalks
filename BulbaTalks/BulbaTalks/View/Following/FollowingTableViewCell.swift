import UIKit

class FollowingTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var followButton: UIButton!

    var isFollowing = true {
        willSet {
            if newValue == true {
                followButton.backgroundColor = UIColor.systemBlue
                followButton.setTitle("Following", for: .normal)
                followButton.setTitleColor(UIColor.white, for: .normal)
            } else {
                followButton.backgroundColor = UIColor.white
                followButton.setTitle("Follow", for: .normal)
                followButton.setTitleColor(UIColor.systemBlue, for: .normal)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    // MARK: Private Functions
    func configureCell() {
        followButton.layer.cornerRadius = followButton.frame.height / 2
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.systemBlue.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }

    // MARK: Actions
    @IBAction func followAction(_ sender: UIButton) {
        isFollowing = !isFollowing
    }
}
