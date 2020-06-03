import UIKit

class ListOfTweetsViewController: UIViewController {
    // MARK: Properties

    @IBOutlet var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var tabBar: UITabBar!

    /// Contains the height of tab bar.
    private enum TabBar {
        static let heightInLandscapeOrientation: CGFloat = 50
    }

    /// Contains the size of  the custom `UIButton`.
    private enum CustomButtonSize {
        static let width: CGFloat = 30
        static let height: CGFloat = 30
    }

    /// Contains a constant size for the anchor’s size attribute.
    private enum ConstantSize {
        static let width: CGFloat = 30
        static let height: CGFloat = 30
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            tabBar.frame.size.height = TabBar.heightInLandscapeOrientation
            tabBar.frame.origin.y = view.frame.height - TabBar.heightInLandscapeOrientation
        }
    }

    // MARK: Private func

    private func configureViewController() {
        let navigationBarItem = UINavigationItem()

        tableView.registerCell(of: ListOfTweetsTableViewCell.self)
        tabBar.barTintColor = .white

        if let logoOfTwitter = UIImage(named: "logoOfTwitter") {
            let titleViewWithImage = UIImageView(image: logoOfTwitter)
            titleViewWithImage.contentMode = .scaleAspectFit
            navigationBarItem.titleView = titleViewWithImage
        }

        let imageFromUserProfile = UIImage()
        let barButtonItem = UIButton(frame: CGRect(x: 0, y: 0,
                                                   width: CustomButtonSize.width,
                                                   height: CustomButtonSize.height))
        barButtonItem.layer.masksToBounds = true
        barButtonItem.layer.cornerRadius = barButtonItem.frame.height / 2
        barButtonItem.setImage(imageFromUserProfile, for: .normal)
        barButtonItem.widthAnchor.constraint(equalToConstant:
            ConstantSize.width).isActive = true
        barButtonItem.heightAnchor.constraint(equalToConstant:
            ConstantSize.height).isActive = true
        barButtonItem.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        navigationBarItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)

        navigationBar.items = [navigationBarItem]
    }

    // MARK: Actions

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
