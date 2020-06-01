import UIKit

class ListOfTweetsViewController: UIViewController {
    // MARK: Properties

    @IBOutlet var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var tabBar: UITabBar!

    private enum HeightOfTabBar {
        static let compact: CGFloat = 50
    }

    private let navigationBarItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            tabBar.frame.size.height = HeightOfTabBar.compact
            tabBar.frame.origin.y = view.frame.height - HeightOfTabBar.compact
        }
    }

    // MARK: Private func

    private func configureViewController() {
        tableView.registerCell(of: ListOfTweetsTableViewCell.self)
        tabBar.barTintColor = .white

        if let logoOfTwitter = UIImage(named: "logoOfTwitter") {
            let titleViewWithImage = UIImageView(image: logoOfTwitter)
            titleViewWithImage.contentMode = .scaleAspectFit
            navigationBarItem.titleView = titleViewWithImage
        }

        let imageFromUserProfile = UIImage()
        let barButtonItem = UIButton(type: .system)
        barButtonItem.layer.masksToBounds = true
        barButtonItem.layer.cornerRadius = navigationBar.frame.height / 2
        barButtonItem.backgroundColor = .black
        barButtonItem.setImage(imageFromUserProfile, for: .normal)
        barButtonItem.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        navigationBarItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)

        navigationBar.items = [navigationBarItem]
    }

    // MARK: Actions

    @objc func openProfile(_: UIBarButtonItem) {}

    @IBAction func addTweet(_: UIButton) {}
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
