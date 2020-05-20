import UIKit

class ListOfTweetsViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tabBar: UITabBar!
    let navigationBarItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if UIDevice.current.orientation.isLandscape {
            let customHeight: CGFloat = 50
            tabBar.frame.size.height = customHeight
            tabBar.frame.origin.y = view.frame.height - customHeight
        }
    }

    // MARK: Private func
    private func configureViewController() {

        let nib = UINib(nibName: "ListOfTweetsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tweetCellID")

        tabBar.barTintColor = .white

        if let logoImage = UIImage(named: "logo") {
            let imageView = UIImageView(image: logoImage)
            imageView.contentMode = .scaleAspectFit
            navigationBarItem.titleView = imageView
        }

        if let profileImage = UIImage(named: "profile") {
            let button = UIButton(type: .system)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 15
            button.setImage(profileImage, for: .normal)
            button.addTarget(self, action: #selector(goToProfileButton), for: .touchUpInside)
            navigationBarItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }

        configureNavigationBarItem()
        navigationBar.items = [navigationBarItem]
    }

    private func configureNavigationBarItem() {
        let navigationLeftBarItem = navigationBarItem.leftBarButtonItem
        let widthOfBarItem = navigationLeftBarItem?.customView?.widthAnchor.constraint(equalToConstant: 30)
        widthOfBarItem?.isActive = true
        let heightOfBarItem = navigationLeftBarItem?.customView?.heightAnchor.constraint(equalToConstant: 30)
        heightOfBarItem?.isActive = true
    }

    // MARK: Actions
    @objc func goToProfileButton(_ sender: UIBarButtonItem) {}

    @IBAction func addTweetButton(_ sender: UIButton) {}
}

// MARK: Extensions
extension ListOfTweetsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCellID",
                                                       for: indexPath) as? ListOfTweetsTableViewCell else {
            return UITableViewCell()
        }

        cell.userImageButton.setImage(UIImage(named: "tweetMediaForTest"), for: .normal)
        cell.userImageButton.setImage(UIImage(named: "tweetMediaForTest"), for: .normal)
        cell.userName.text = "Tatsiana"
        cell.userIdenticalName.text = "@tany"
        cell.tweetCreatedAt.text = "2019-09-12"
        cell.tweetContent.text = "Hello, this is my first Tweet! And I will post here a lot of interesting!"
        cell.tweetMedia.image = UIImage(named: "tweetMediaForTest")

        return cell
    }
}
