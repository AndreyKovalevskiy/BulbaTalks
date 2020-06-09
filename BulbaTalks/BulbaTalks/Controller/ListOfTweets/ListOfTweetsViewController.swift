import UIKit

class ListOfTweetsViewController: UIViewController {
    // MARK: IBOutlet

    @IBOutlet var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var tabBar: UITabBar!

    /// Constants related to the tab bar.
    private enum TabBar {
        static let heightInLandscapeOrientation: CGFloat = 50
    }

    /// Constants related to the custom `UIButton`.
    private enum CustomButton {
        static let barButtonItemWidth: CGFloat = 30
        static let barButtonItemHeight: CGFloat = 30
    }

    /// Constants related to the layout anchor of `UIView`.
    private enum LayoutAnchor {
        static let barButtonItemViewWidthAnchor: CGFloat = 30
        static let barButtonItemViewHeightAnchor: CGFloat = 30
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
            tabBar.frame.size.height = TabBar.heightInLandscapeOrientation
            tabBar.frame.origin.y = view.frame.height - TabBar.heightInLandscapeOrientation
        }
    }

    // MARK: Private functions

    /// Uses to customize `UITableView`.
    private func configureTableView() {
        tableView.registerCell(of: ListOfTweetsTableViewCell.self)
    }

    /// Uses to customize `UITabBar`.
    private func configureTabBar() {
        tabBar.barTintColor = .white
    }

    /// Adds `UIImage` in the title of navigation bar.
    private func configureTitleViewOfNavigationBar() {
        if let logoOfTwitter = UIImage(named: "logoOfTwitter") {
            let titleViewWithImage = UIImageView(image: logoOfTwitter)
            titleViewWithImage.contentMode = .scaleAspectFit
            navigationItem.titleView = titleViewWithImage
        }
    }

    /**
     Adds a rounded left `UIBarButtonItem` with the image
     of the authenticated user.
     */
    private func configureLeftBarButtonItem() {
        let imageFromUserProfile = UIImage(named: "mockedUserImage")
        let barButtonItem = UIButton(frame: CGRect(x: 0, y: 0,
                                                   width: CustomButton.barButtonItemWidth,
                                                   height: CustomButton.barButtonItemHeight))
        barButtonItem.layer.masksToBounds = true
        barButtonItem.layer.cornerRadius = barButtonItem.frame.height / 2
        barButtonItem.setImage(imageFromUserProfile, for: .normal)
        barButtonItem.widthAnchor.constraint(equalToConstant:
            LayoutAnchor.barButtonItemViewWidthAnchor).isActive = true
        barButtonItem.heightAnchor.constraint(equalToConstant:
            LayoutAnchor.barButtonItemViewHeightAnchor).isActive = true
        barButtonItem.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)

        navigationBar.items = [navigationItem]
    }

    // MARK: IBAction

    @objc func openProfile(_: UIBarButtonItem) {}

    @IBAction func composeTweet(_: UIButton) {}
}

// MARK: Extensions

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
