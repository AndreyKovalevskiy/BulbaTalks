import UIKit

class ListOfTweetsViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var tabBar: UITabBar!

    /// Describes constants used to configure `UIViewController`.
    private enum Constants {
        /// Constants related to the tab bar.
        enum TabBar {
            /**
             Represents the height of the tab bar
             in landscape orientation.
             */
            static let heightInLandscapeOrientation: CGFloat = 50
        }

        /// Constants related to the `UIBarButtonItem`.
        enum BarButtonItem {
            /// Represents the width of the `UIBarButtonItem`.
            static let width: CGFloat = 30
            /// Represents the height of the `UIBarButtonItem`.
            static let height: CGFloat = 30

            /**
             Constants used to position the view
             of `UIBarButtonItem` relative to others views
             by adding constraints.
             */
            enum Position {
                /// Used to add width constraints.
                static let width: CGFloat = 30
                /// Used to add height constraints.
                static let height: CGFloat = 30
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureTabBar()
        configureTitleViewOfNavigationBar()
        configureLeftBarButtonItem()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            tabBar.frame.size.height = Constants.TabBar.heightInLandscapeOrientation
            tabBar.frame.origin.y = view.frame.height - Constants.TabBar.heightInLandscapeOrientation
        }
    }

    // MARK: - Private functions

    /// Used to configure `UITableView`.
    private func configureTableView() {
        tableView.registerCell(of: ListOfTweetsTableViewCell.self)
    }

    /// Used to configure `UITabBar`.
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
        let barButtonItem = UIButton(frame: CGRect(x: 0, y: 0,
                                                   width: Constants.BarButtonItem.width,
                                                   height: Constants.BarButtonItem.height))
        barButtonItem.layer.masksToBounds = true
        barButtonItem.layer.cornerRadius = barButtonItem.frame.height / 2
        barButtonItem.setImage(imageFromUserProfile, for: .normal)
        barButtonItem.widthAnchor.constraint(equalToConstant:
            Constants.BarButtonItem.Position.width).isActive = true
        barButtonItem.heightAnchor.constraint(equalToConstant:
            Constants.BarButtonItem.Position.height).isActive = true
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
