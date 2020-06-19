import UIKit

class ListOfTweetsViewController: UIViewController {
    // MARK: - Properties

    /**
     An authenticated user, or `nil` if the authenticated user was
     not received.
     */
    var user: User?

    /**
     `UIButton` used to create a left `UIBarButtonItem`
     of navigation bar.
     */
    private let barButtonItem = UIButton(frame:
        CGRect(x: 0, y: 0,
               width: Constants.BarButtonItem.width,
               height: Constants.BarButtonItem.height))

    // MARK: - IBOutlet

    @IBOutlet var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var tabBar: UITabBar!

    // MARK: - Instance Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureTabBar()
        configureTitleViewOfNavigationBar()
        configureLeftBarButtonItem()
        getAndFillAuthenticatedUserAndSetImageInNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            tabBar.frame.size.height = Constants.TabBar.heightInLandscapeOrientation
            tabBar.frame.origin.y = view.frame.height - Constants.TabBar.heightInLandscapeOrientation
        }
    }

    // MARK: - Private functions

    /**
     Gets an authenticated user, or `nil`
     if the authenticated user was not received.
     If user was received, fill received user and
     set the user's image in the left `UIBarButtonItem`
     of navigation bar.
     */
    private func getAndFillAuthenticatedUserAndSetImageInNavigationBar() {
        TwitterDataSource().getAuthenticatedUser { user in
            if let user = user {
                self.user = user
                Bundle.main.getImage(at: URL(fileURLWithPath: user.profileImageURLString)) { image in
                    DispatchQueue.main.async {
                        self.barButtonItem.setImage(image, for: .normal)
                    }
                }
            }
        }
    }

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
     Adds a rounded left `UIBarButtonItem` of navigation bar.
     */
    private func configureLeftBarButtonItem() {
        barButtonItem.layer.masksToBounds = true
        barButtonItem.layer.cornerRadius = barButtonItem.frame.height / 2
        barButtonItem.widthAnchor.constraint(equalToConstant:
            Constants.BarButtonItem.Anchor.width).isActive = true
        barButtonItem.heightAnchor.constraint(equalToConstant:
            Constants.BarButtonItem.Anchor.height).isActive = true
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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(of: ListOfTweetsTableViewCell.self) else {
            return UITableViewCell()
        }

        return cell
    }
}
